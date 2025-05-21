//
//  URLRequest+ExtensionsTests.swift
//  CoreNetworkingTests
//

import CoreFoundational
import CoreNetworking
import Foundation
import Testing

struct URLRequest_ExtensionsTests {
    @Test("setContentType adds correct Content-Type header for JSON and form-urlencoded")
    func test_setContentType_addsCorrectContentType() throws {
        var sut = makeSUT()
        
        sut.setContentType(.json)
        #expect(sut.value(forHTTPHeaderField: "Content-Type") == "application/json")

        sut.setContentType(.formURLencoded)
        #expect(sut.value(forHTTPHeaderField: "Content-Type") == "application/x-www-form-urlencoded")
    }

    private func makeSUT() -> URLRequest {
        let url = URL(string: "https://raw.githubusercontent.com/")!
        return URLRequest(method: .get, url: url)
    }
}
