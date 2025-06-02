//
//  Recipe.swift
//  RecipesFeedFeature
//
//  Created on 27/06/2021.
//

import Foundation

public struct Recipe: Equatable, Sendable {
    let id: String
    let type: String
    let sectionId: String
    let sectionName: String
    let webPublicationDate: Date
    let webTitle: String
    let webUrl: String
    let apiUrl: String
    let fields: Fields?
    let tags: [Tag]?
    let isHosted: Bool
    let pillarId: String?
    let pillarName: String?
}
