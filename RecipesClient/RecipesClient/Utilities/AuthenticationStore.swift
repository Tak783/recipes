//
//  AuthenticationStore.swift
//  RecipesClient
//
//  Created by Tak Mazarura on 22/05/2025.
//

import Foundation

struct AuthenticationStore {
    #warning("Remove temporary AUTH solution when backend thats stores API keys is ready")
    static func storeAPIKeys() {
        UserDefaults.standard.set("3d1eec2b-f45d-4334-b562-0d7990366e49", forKey: "RecipesAPIKey")
        UserDefaults.standard.synchronize()
    }
}
