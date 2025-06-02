
//
//  RecipeFeedViewModel.swift
//  RecipesFeature
//
//  Created on 21/05/2025.
//

import CoreFoundational
import Foundation
import SwiftUI

public final class RecipeFeedViewModel: ObservableObject {
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? = nil
    @Published public var recipePresentationModels = [RecipePresentationModel]()
    
    public let title: String
    
    private var recipes = [Recipe]()
    private let recipeFeedService: RecipesFeedServiceable
    
    public init(recipeFeedService: RecipesFeedServiceable, title: String) {
        self.recipeFeedService = recipeFeedService
        self.title = title
        self.recipes = []
    }
}

// MARK: - ViewModelLoading
extension RecipeFeedViewModel: ViewModelLoading {}

// MARK: - RecipeFeedViewModellable
extension RecipeFeedViewModel: RecipeFeedViewModellable {
    public func loadFeed() async {
        setIsLoadingStatus()
        let result = await recipeFeedService.load()
        switch result {
        case let .success(returnedRecipes):
            didSuccessfullyLoadRecipes(returnedRecipes)
        case .failure:
            errorMessage = "Failed to Load Feed"
        }
        setIsLoadingStatus(false)
    }
}

// MARK: - Helpers
extension RecipeFeedViewModel {
    @MainActor
    private func didSuccessfullyLoadRecipes(_ returnedRecipes: [Recipe]) {
        recipes = returnedRecipes
        recipePresentationModels = returnedRecipes.map{ RecipePresentationModel(withRecipe: $0) }
        errorMessage = nil
    }
    
    @MainActor
    private func didSFailToLoadRecipes(withError error: Error) {
        safePrint(error.localizedDescription)
        errorMessage = "Failed to Load Feed"
    }
}
