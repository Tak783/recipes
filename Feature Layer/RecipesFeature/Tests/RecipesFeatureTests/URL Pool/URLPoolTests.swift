//
//  URLPoolTests.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

import Foundation
import CoreFoundational
import CoreNetworking
@testable import RecipesFeature
import Testing

@Suite
final class URLPoolTests: RecipieFeedTestAuthenticationTestable {
    let expectedScheme = "https"
    let expectedHost = "content.guardianapis.com"
    let expectedAPIKey = "a1b2c3d4"
    
    init() throws {
        setupAuthentication(withAPIKey: expectedAPIKey)
    }
    
    deinit {
        Self.resetUserDefaults()
    }
}

// MARK: - UserDefaultsResetting
extension URLPoolTests: UserDefaultsResetting {
    @Test("recipesFeedRequest generates correct request")
    func test_recipesRequest_configuresRecipesRequestCorrectly() {
        // Arrange
        let endpoint = "search"
        let apiKeySuffix = expectedAPIKeySuffix(withAPIKey: expectedAPIKey)
        let requestPath = "&format=json&tag=tone/recipes&show-tags=series&show-fields=thumbnail,headline"
        let expectedPathSuffix = endpoint + "?" + apiKeySuffix + requestPath
        let expectedUrlAbsoluteString = fullURL(withPathSuffix: expectedPathSuffix)
        
        // Act
        let request = URLPool.recipesFeedRequest()
        
        // Assert
        #expect(request.url?.absoluteString == expectedUrlAbsoluteString)
        #expect(request.httpMethod == URLRequest.HTTPMethod.get.rawValue)
    }
}
    
// MARK: - Helpers
extension URLPoolTests {
    private func fullURL(withPathSuffix pathSuffix: String) -> String {
        expectedScheme + "://" + expectedHost + "/" + pathSuffix
    }
    
    private func expectedAPIKeySuffix(withAPIKey apiKey: String) -> String {
        "api-key=\(apiKey)"
    }
}
