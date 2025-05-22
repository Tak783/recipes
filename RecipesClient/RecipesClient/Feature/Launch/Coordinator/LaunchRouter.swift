//
//  LaunchRouter.swift
//  RecipesClient
//
//  Created by Tak Mazarura on 22/05/2025.
//

import SwiftUI

@MainActor
struct LaunchRouter {
    @ViewBuilder
    static func navigateToDestination(
        _ destination: LaunchCoordinator.NavigationDestination
    ) -> some View {
        switch destination {
        case .recipeFeed:
            LaunchViewFactory.recipeFeedView()
        }
    }
}
