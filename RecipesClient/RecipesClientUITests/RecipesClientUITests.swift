//
//  RecipesClientUITests.swift
//  RecipesClientUITests
//
//  Created by Tak Mazarura on 21/05/2025.
//

import SwiftUI
import Testing
import XCTest
@testable import RecipesClient

struct RecipeFeedViewTests {
    @Test
    func test_loadingState_showsProgressView() {
        let viewModel = MockRecipeFeedViewModel(
            isLoading: true,
            errorMessage: nil,
            recipePresentationModels: [],
            title: "Recipes"
        )
        
        let view = RecipeFeedView(recipeFeedViewModel: viewModel)
        
        #expect(view)
            .toShow {
                ProgressView("Loading Recipes...")
            }
    }

    @Test
    func test_errorState_showsErrorAndRetryButton() async throws {
        let viewModel = MockRecipeFeedViewModel(
            isLoading: false,
            errorMessage: "Network error",
            recipePresentationModels: [],
            title: "Recipes"
        )

        let view = RecipeFeedView(recipeFeedViewModel: viewModel)

        #expect(view)
            .toShow {
                Text("Network error")
                Button("Retry") { }
            }
    }

    @Test
    func test_listState_showsRecipes() async throws {
        let sampleModel = RecipePresentationModel(
            id: UUID(),
            title: "Chicken Curry",
            headline: "Delicious & Easy",
            imageURL: nil
        )

        let viewModel = MockRecipeFeedViewModel(
            isLoading: false,
            errorMessage: nil,
            recipePresentationModels: [sampleModel],
            title: "Recipes"
        )

        let view = RecipeFeedView(recipeFeedViewModel: viewModel)

        #expect(view)
            .toShow {
                Text("Chicken Curry")
            }
    }
}

import Foundation
import Combine

final class MockRecipeFeedViewModel: RecipeFeedViewModel {
    override var isLoading: Bool {
        didSet { objectWillChange.send() }
    }
    override var errorMessage: String? {
        didSet { objectWillChange.send() }
    }
    override var recipePresentationModels: [RecipePresentationModel] {
        didSet { objectWillChange.send() }
    }

    init(isLoading: Bool, errorMessage: String?, recipePresentationModels: [RecipePresentationModel], title: String) {
        super.init()
        self.isLoading = isLoading
        self.errorMessage = errorMessage
        self.recipePresentationModels = recipePresentationModels
        self.title = title
    }

    override func loadFeed() {
        // track retry call or simulate async loading here
    }
}
