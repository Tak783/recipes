//
//  URLPoolTests.swift
//  CoreNetworking
//
//  Created on 21/05/2025.
//

import CoreNetworking
import Foundation
import Testing

struct URLPoolTests {
    private static let scheme = "https"
    private static let host = "api.core.com"
    private static let path = "/feed"

    @Test("configureURL returns correct URL without query parameters")
    func configureURL_withoutQueryParameters() throws {
        let sut = "https://api.core.com/feed"

        let url = URLPool.configureURL(
            scheme: Self.scheme,
            host: Self.host,
            path: Self.path
        )

        #expect(url.absoluteString == sut)
    }

    @Test("configureURL returns correct URL with query parameters")
    func configureURL_withQueryParameters() throws {
        let sut = "https://api.core.com/feed?item=0"
        let parameters = [URLQueryItem(name: "item", value: "0")]

        let url = URLPool.configureURL(
            scheme: Self.scheme,
            host: Self.host,
            path: Self.path,
            parameters: parameters
        )

        #expect(url.absoluteString == sut)
    }
}
