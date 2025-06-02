//
//  URLRequest+Extensions.swift
//  CoreNetworking
//
//  Created on 06/06/2021.
//

import Foundation

public extension URLRequest {
    enum ContentType: String {
        case json = "application/json"
        case formURLencoded = "application/x-www-form-urlencoded"
    }
    
    mutating func setContentType(_ contentType: ContentType) {
        setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
    }
}

public extension URLRequest {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
    }
}

public extension URLRequest {
    init(method: HTTPMethod, url: URL){
        self.init(url: url)
        httpMethod = method.rawValue
    }
}
