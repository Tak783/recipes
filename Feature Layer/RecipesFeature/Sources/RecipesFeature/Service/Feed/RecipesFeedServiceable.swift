//
//  RecipesFeedServiceable.swift
//  RecipesFeature
//
//  Created on 21/05/2025.
//

public protocol RecipesFeedServiceable: Sendable {
    typealias RecipesFeedResult = Swift.Result<[Recipe], Error>
    
    func load() async -> RecipesFeedResult
}
