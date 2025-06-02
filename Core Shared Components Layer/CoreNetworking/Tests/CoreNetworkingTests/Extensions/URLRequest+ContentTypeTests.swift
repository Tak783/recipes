//
//  URLSessionHTTPClientTests.swift
//  CoreNetworking
//
//  Created on 21/05/2025.
//

import CoreNetworking
import Foundation
import Testing

@Suite
struct URLRequest_ContentTypeTests {
    @Test("setContentType sets JSON Content-Type header")
    func test_setsJSONContentType() {
        var sut = URLRequest(url: URL(string: "https://example.com")!)
        sut.setContentType(.json)
        #expect(sut.value(forHTTPHeaderField: "Content-Type") == "application/json")
    }

    @Test("setContentType sets Form-URLencoded Content-Type header")
    func test_setsFormURLEncodedContentType() {
        var sut = URLRequest(url: URL(string: "https://example.com")!)
        sut.setContentType(.formURLencoded)
        #expect(sut.value(forHTTPHeaderField: "Content-Type") == "application/x-www-form-urlencoded")
    }
}
