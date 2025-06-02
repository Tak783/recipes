//
//  AuthenticationStore.swift
//  RecipesClient
//
//  Created on 22/05/2025.
//

import Foundation

struct AuthenticationStore {
    #warning("Remove temporary AUTH solution when backend thats stores API keys is ready")
    static func storeAPIKeys() {
        UserDefaults.standard.set("{add_your_own_key}", forKey: "RecipesAPIKey")
        UserDefaults.standard.synchronize()
    }
}
