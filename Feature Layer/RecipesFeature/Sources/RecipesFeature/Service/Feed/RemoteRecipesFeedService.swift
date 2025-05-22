//
//  RemoteRecipesFeedService.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

import CoreFoundational
import CoreNetworking
import Foundation

public struct RemoteRecipesFeedService: Sendable {
    let client: HTTPClient
    
    public enum Error: Swift.Error {
        case invalidResponse
        case invalidData
    }
    
    public init(client: HTTPClient) {
        self.client = client
    }
}

// MARK: - RecipesFeedServiceable
extension RemoteRecipesFeedService: RecipesFeedServiceable {
    public func load() async -> RecipesFeedResult {
        let request = URLPool.recipesFeedRequest()
        let result = await client.performRequest(request)
        switch result {
        case let .success((data, response)):
            return decodeLoadRecipesSuccessResponse(data: data, response: response)
        case .failure(let error):
            return .failure(error)
        }
    }
}

// MARK: Helpers
extension RemoteRecipesFeedService {
    private func decodeLoadRecipesSuccessResponse(
        data: Data,
        response: HTTPURLResponse
    ) -> RecipesFeedResult {
        do {
            if response.statusCode != 200 {
                return .failure(Error.invalidResponse)
            } else {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.isoDateTimeFormatter)
                
                let recipeResponseFeed = try decoder.decode(RemoteRecipeResponse.self, from: data)
                return .success(recipeResponseFeed.response.results.toModels())
            }
        } catch {
            return .failure(Error.invalidData)
        }
    }
}
