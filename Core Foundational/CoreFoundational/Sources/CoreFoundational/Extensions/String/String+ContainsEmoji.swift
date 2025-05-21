//
//  String+ContainsEmoji.swift
//
//
//  Created  22/11/2023.
//

import Foundation

extension String {
    public func containsEmoji() -> Bool {
        for scalar in unicodeScalars {
            if scalar.properties.isEmoji {
                return true
            }
        }
        return false
    }
}
