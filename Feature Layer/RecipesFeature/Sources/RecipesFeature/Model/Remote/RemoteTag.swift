//
//  RemoteTag.swift
//  RecipesFeedFeature
//
//  Created on 27/06/2021.
//

import Foundation

struct RemoteTag: Decodable {
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

extension RemoteTag {
    func toModel() -> Tag {
        Tag(
            id: id,
            type: type,
            webTitle: webTitle,
            webUrl: webUrl,
            references: references,
            bio: bio,
            firstName: firstName,
            lastName: lastName,
            twitterHandle: twitterHandle
        )
    }
}

extension Array where Element == RemoteTag {
    func toModels() -> [Tag] {
        self.compactMap {
            $0.toModel()
        }
    }
}
