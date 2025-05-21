//
//  RecipesAPIURLPoolable.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

import Foundation

protocol RecipesAPIURLPoolable {
    static func recipesFeedRequest() -> URLRequest
}
