//
//  Locale+Extensions.swift
//
//
//  Created  10/09/2024.
//

import Foundation

extension Locale {
    public static func getLocale(for currencyCode: String) -> Locale? {
        for localeIdentifier in Locale.availableIdentifiers {
            let locale = Locale(identifier: localeIdentifier)
            if locale.currency?.identifier == currencyCode {
                return locale
            }
        }
        return nil
    }
}
