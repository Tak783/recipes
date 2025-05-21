//
//  URLRequest+HTTPMethodTests.swift
//  CoreNetworking
//
//  Created by Tak Mazarura on 21/05/2025.
//

import CoreNetworking
import Foundation
import Testing

@Suite
struct URLRequest_HTTPMethodTests {
    @Test("HTTPMethod raw values are correct")
    func test_httpMethodRawValues() {
        #expect(URLRequest.HTTPMethod.get.rawValue == "GET")
        #expect(URLRequest.HTTPMethod.post.rawValue == "POST")
        #expect(URLRequest.HTTPMethod.put.rawValue == "PUT")
    }
}
