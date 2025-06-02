//
//  LaunchViewFactory.swift
//  RecipesClient
//
//  Created on 22/05/2025.
//

import CoreNetworking
import RecipesFeature
import SwiftUI

@MainActor
struct LaunchViewFactory {
    static func launchView() -> some View {
        let coordinator = LaunchCoordinator()
        return LaunchView(coordinator: coordinator)
    }

    static func recipeFeedView() -> some View {
        let client = URLSessionHTTPClient()
        let recipeFeedService = RemoteRecipesFeedService(client: client)
        let recipeFeedViewModel = RecipeFeedViewModel(
            recipeFeedService: recipeFeedService,
            title: "Recipes"
        )
        return RecipeFeedView(recipeFeedViewModel: recipeFeedViewModel)
    }
}
