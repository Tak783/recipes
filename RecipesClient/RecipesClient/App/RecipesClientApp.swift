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
            LaunchViewFactory.welcomeView()
        }
        .onChange(of: scenePhase) { _,_ in
            AuthenticationStore.storeAPIKeys()
        }
    }
}
