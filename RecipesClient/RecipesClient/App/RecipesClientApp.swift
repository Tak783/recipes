//
//  RecipesClientApp.swift
//  RecipesClient
//
//  Created by Tak Mazarura on 21/05/2025.
//

import CoreNetworking
import RecipesFeature
import SwiftUI

@main
struct RecipesClientApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            let client = URLSessionHTTPClient()
            let recipeFeedService = RemoteRecipesFeedService(client: client)
            let recipeFeedViewModel = RecipeFeedViewModel(recipeFeedService: recipeFeedService, title: "Recipes")
            RecipeFeedView(recipeFeedViewModel: recipeFeedViewModel)
        }
        .onChange(of: scenePhase) { _,_ in
            setupAuthenticationStore()
        }
    }
}
    
// MARK: - Helpers
extension RecipesClientApp {
    /// Note - This is a temporary solution, API key would be on Backend requests would be peformed via the Backend
    private func setupAuthenticationStore() {
        UserDefaults.standard.set("3d1eec2b-f45d-4334-b562-0d7990366e49", forKey: "RecipesAPIKey")
        UserDefaults.standard.synchronize()
    }
}
