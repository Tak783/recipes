//
//  LaunchCoordinator.swift
//  RecipesClient
//
//  Created on 22/05/2025.
//

import SwiftUI

@MainActor
final class LaunchCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    enum NavigationDestination: Hashable {
        case recipeFeed
    }
    
    func navigateToRecipeFeed() {
        navigate(toDestination: .recipeFeed)
    }
}

// MARK: - Coordinating
extension LaunchCoordinator: Coordinating {
    typealias Destination = NavigationDestination
}
