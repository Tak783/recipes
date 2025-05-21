//
//  MockData.swift
//
//
//  Created by Tak Mazarura on 11/10/2023.
//

import Foundation

public final class MockData {
    public enum FileName: String {
        case badJSON = "BadJSON"
        case emptyJSON = "EmptyJSON"
    }
    
    public static var mockNetworkingBundle: Bundle {
        Bundle.module
    }
}

extension MockData {
    public static func any_badJSONData(
        fromBundle bundle: Bundle = MockData.mockNetworkingBundle
    ) -> Data {
        return MockServer.loadLocalJSON(
            FileName.badJSON.rawValue,
            fromBundle: bundle
        )
    }

    public static func any_emptyJSONData(
        fromBundle bundle: Bundle = MockData.mockNetworkingBundle
    ) -> Data {
        return MockServer.loadLocalJSON(
            FileName.emptyJSON.rawValue,
            fromBundle: bundle
        )
    }
    
    public static func any_data(
        for filename: String,
        fromBundle bundle: Bundle = MockData.mockNetworkingBundle
    ) -> Data {
        return MockServer.loadLocalJSON(
            filename,
            fromBundle: bundle
        )
    }
}

