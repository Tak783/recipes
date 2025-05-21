//
//  String+Currency.swift
//  
//
//  Created  13/05/2023.
//

import Foundation

extension String {
    public static func toCurrencySymbol(forCurrencyCode code: String?) -> String? {
        guard let code = code else {
            return nil
        }
        let locale = NSLocale(localeIdentifier: code)
        if locale.displayName(forKey: .currencySymbol, value: code) == code {
            let newlocale = NSLocale(localeIdentifier: code.dropLast() + "_en")
            return newlocale.displayName(forKey: .currencySymbol, value: code)
        }
        return locale.displayName(forKey: .currencySymbol, value: code)
    }
}
