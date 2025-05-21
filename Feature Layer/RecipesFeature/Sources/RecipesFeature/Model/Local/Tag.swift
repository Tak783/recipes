//
//  Tag.swift
//  RecipesFeedFeature
//
//  Created by Tak Mazarura on 27/06/2021.
//

import Foundation

public struct Tag: Equatable {
    let id: String
    let type: String
    let webTitle: String
    let webUrl: String
    let references: [String]
    let bio: String?
    let firstName: String?
    let lastName: String?
    let twitterHandle: String?
}
