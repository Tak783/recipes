//
//  RemoteRecipesFeedServiceTests.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

import Foundation
import CoreFoundational
import CoreNetworking
import MockNetworking
@testable import RecipesFeature
import Testing

@Suite
@MainActor
final class RemoteRecipesFeedServiceTests {
    init() throws {
        setupAuthentication(withAPIKey: "a1b2c3d4")
    }
    
    deinit {
        Self.resetUserDefaults()
    }
}

// MARK: - UserDefaultsResetting
extension RemoteRecipesFeedServiceTests: UserDefaultsResetting {}

// MARK: - RemoteRecipesFeedServiceTestSpec
extension RemoteRecipesFeedServiceTests: RemoteRecipesFeedServiceTestSpec {
    @Test("load fails on non-200 status code")
    func load_onSuccessWithNon200Code_returnsError() async throws {
        let (sut, client) = makeSUT()
       
        async let result = sut.load()
        
        try await client.waitForRequest()
        client.complete(withStatusCode: 100, data: Data())
        
        if case let .failure(error as RemoteRecipesFeedService.Error) = await result {
            #expect(error == .invalidResponse)
        } else {
            Issue.record("Expected .invalidResponse, got \(await result)")
        }
    }
    
    @Test("load fails on invalid JSON")
    func load_onSuccessWithInvalidData_returnsInvalidDataError() async throws {
        let (sut, client) = makeSUT()

        async let result = sut.load()

        try await client.waitForRequest()
        client.complete(withStatusCode: 200, data: Data("invalid-json".utf8))

        let loadResult = await result

        if case let .failure(error as RemoteRecipesFeedService.Error) = loadResult {
            #expect(error == .invalidData)
        } else {
            Issue.record("Expected .invalidData")
        }
    }
    
    @Test("load succeeds on valid data and 200 response")
    func load_onValidResponse_returnsRecipes() async throws {
        let (sut, client) = makeSUT()

        async let result = sut.load()

        try await client.waitForRequest()
        let data = MockData.any_data(for: MockData.FileName.recipesFeed.rawValue)
        client.complete(withStatusCode: 200, data: data)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.isoDateTimeFormatter)
       
        let recipeResponseFeed = try decoder.decode(RemoteRecipeResponse.self, from: data)
        let expectedRecipes = recipeResponseFeed.response.results.toModels()
        
        let loadResult = await result

        if case let .success(recipes) = loadResult {
            #expect(!recipes.isEmpty)
            #expect(recipes == expectedRecipes)
        } else {
            Issue.record("Expected success with recipes, got \(loadResult)")
        }
    }
}

// MARK: - Make Sut
extension RemoteRecipesFeedServiceTests {
    func makeSUT() -> (RemoteRecipesFeedService, HTTPClientSpy) {
        setupAuthentication(withAPIKey: "a1b2c3d4")
        
        let client = HTTPClientSpy()
        let sut = RemoteRecipesFeedService(client: client)
        return (sut, client)
    }
}
