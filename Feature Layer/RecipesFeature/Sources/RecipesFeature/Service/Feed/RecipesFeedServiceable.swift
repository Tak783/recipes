//
//  RecipesFeedServiceable.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

public protocol RecipesFeedServiceable: AnyObject {
    typealias RecipesFeedResult = Swift.Result<[Recipe], Error>
    
    func load() async -> RecipesFeedResult
}
