//
//  Class+UserDefaults.swift
//  RecipesFeature
//
//  Created by Tak Mazarura on 21/05/2025.
//

import Foundation

protocol UserDefaultsResetting {
    static func resetUserDefaults()
}

// MARK: - Defaaut Implementation 
extension UserDefaultsResetting {
    static func resetUserDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
