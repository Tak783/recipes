//
//  Encodable+Dictionary.swift
//  Goats
//
//  Created  20/03/2023.
//

import Foundation

extension Encodable {
    public var dictionary: [String: Any]? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        guard let data = try? encoder.encode(self) else {
            return nil
        }
        let jsonString = String(data: data, encoding: .utf8)!
        return jsonString.convertToDictionary()
    }
}
