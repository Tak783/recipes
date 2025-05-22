//
//  RecipePresentationModel.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

import Foundation

public final class RecipePresentationModel: RecipePresentationModellable, Identifiable {
    public private(set) var id: String
    public private(set) var headline: String?
    public private(set) var title: String?
    public private(set) var imageURL: URL?
    
    public init(withRecipe recipe: Recipe) {
        id = recipe.id
        headline = recipe.tags?.first?.webTitle.uppercased()
        title = recipe.fields?.headline
        if let thumbnailURL = recipe.fields?.thumbnail {
            imageURL = URL(string: thumbnailURL) 
        }
    }
}
