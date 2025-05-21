//
//  URLRequest+ConvenienceInitTests.swift
//  CoreNetworking
//
//  Created by Tak Mazarura on 21/05/2025.
//

import CoreFoundational
import CoreNetworking
import Foundation
import Testing

@Suite
struct URLRequest_ConvenienceInitTests {
    @Test("convenience init sets method and URL correctly")
    func test_init_setsMethodAndURL() {
        let url = URL(string: "https://example.com")!
        let sut = URLRequest(method: .post, url: url)
        
        #expect(sut.httpMethod == "POST")
        #expect(sut.url == url)
    }
}
