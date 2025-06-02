//
//  RecipePresentationModellable.swift
//  RecipesFeature
//
//  Created on 21/05/2025.
//

import Foundation

public protocol RecipePresentationModellable: AnyObject, Identifiable {
    var id: String { get }
    var title: String? { get }
    var headline: String? { get }
    var imageURL: URL? { get }
    
    init(withRecipe recipe: Recipe)
}
