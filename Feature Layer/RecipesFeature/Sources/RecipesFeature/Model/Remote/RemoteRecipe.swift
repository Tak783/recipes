//
//  RemoteRecipe.swift
//  RecipesFeedFeature
//
//  Created on 27/06/2021.
//

import Foundation

struct RemoteRecipe: Decodable {
    let id: String
    let type: String
    let sectionId: String
    let sectionName: String
    let webPublicationDate: Date
    let webTitle: String
    let webUrl: String
    let apiUrl: String
    let fields: RemoteFields?
    let tags: [RemoteTag]?
    let isHosted: Bool
    let pillarId: String?
    let pillarName: String?
}

extension RemoteRecipe {
    func toModel() -> Recipe {
        Recipe(
            id: id,
            type: type,
            sectionId: sectionId,
            sectionName: sectionName,
            webPublicationDate: webPublicationDate,
            webTitle: webTitle,
            webUrl: webUrl,
            apiUrl: apiUrl,
            fields: fields?.toModel(),
            tags: tags?.toModels(),
            isHosted: isHosted,
            pillarId: pillarId,
            pillarName: pillarName
        )
    }
}

extension Array where Element == RemoteRecipe {
    func toModels() -> [Recipe] {
        self.compactMap {
            $0.toModel()
        }
    }
}
