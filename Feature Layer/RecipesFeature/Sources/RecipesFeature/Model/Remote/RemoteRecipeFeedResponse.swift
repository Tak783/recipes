//
//  RemoteRecipeFeed.swift
//  RecipesFeedFeature
//
//  Created on 27/06/2021.
//

import Foundation

struct RemoteRecipeResponse: Decodable {
    let response: RemoteRecipeFeedResponse
}

struct RemoteRecipeFeedResponse: Decodable {
    let status: String?
    let total: Int
    let startIndex: Int
    let pageSize: Int
    let currentPage: Int
    let pages: Int
    let orderBy: String
    let results: [RemoteRecipe]
}
