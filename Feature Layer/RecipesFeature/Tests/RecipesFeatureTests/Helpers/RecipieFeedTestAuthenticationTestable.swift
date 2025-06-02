//
//  RecipieFeedTestAuthenticationTestable.swift
//  RecipesFeature
//
//  Created on 21/05/2025.
//

import Foundation

protocol RecipieFeedTestAuthenticationTestable {
    func setupAuthentication(withAPIKey apiKey: String)
}

extension RecipieFeedTestAuthenticationTestable {
    func setupAuthentication(withAPIKey apiKey: String) {
        UserDefaults.standard.set(apiKey, forKey: "RecipesAPIKey")
    }
}
