//
//  RemoteFields.swift
//  RecipesFeedFeature
//
//  Created on 27/06/2021.
//

import Foundation

struct RemoteFields: Decodable {
    let headline: String
    let thumbnail: String
}

extension RemoteFields {
    func toModel() -> Fields {
        Fields(
            headline: headline,
            thumbnail: thumbnail
        )
    }
}
