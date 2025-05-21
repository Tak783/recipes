//
//  String+Emoji.swift
//  CoreFoundational
//
//  Created  11/11/2024.
//

extension String {
    public func isAllEmojis() -> Bool {
        for scalar in self.unicodeScalars {
            if !scalar.properties.isEmoji || (scalar.value >= 0x1F3FB && scalar.value <= 0x1F3FF) {
                return false
            }
        }
        return true
    }
}
