//
//  URLPool.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

import Foundation
import CoreFoundational
import CoreNetworking

// MARK: - URL Components
extension URLPool {
    private static let scheme = "https"
    private static let host = "content.guardianapis.com"
    private static let path = "/search?"
    
    private enum EndPoints: String {
        case recipes = "&format=json&tag=tone/recipes&show-tags=series&show-fields=thumbnail,headline"
    }
}

// MARK: - Requests
extension URLPool: RecipesAPIURLPoolable {
    static func recipesFeedRequest() -> URLRequest {
        let endPoint = path + self.apiKeySuffix() + EndPoints.recipes.rawValue
        let url = configureURL(scheme: scheme, host: host, path: endPoint)
        let request = URLRequest.init(method: .get, url: url)
        return request
    }
}

// MARK: - Helpers
extension URLPool {
    /// Note - This is a temporary solution. A keychain access helper solution is better.
    private static func apiKeySuffix() -> String {
        guard let apiKey = UserDefaults.standard.string(forKey: "RecipesAPIKey") else {
            assertionFailure("Failed to return an API Key from `UserDefaults`")
            return .init()
        }
        return "api-key=\(apiKey)"
    }
}
