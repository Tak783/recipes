//
//  RecipeFeedViewModellable.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

import Foundation

@MainActor
public protocol RecipeFeedViewModellable: ObservableObject {
    var title: String { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get }
    var recipePresentationModels: [RecipePresentationModel] { get }

    func loadFeed() async
}
