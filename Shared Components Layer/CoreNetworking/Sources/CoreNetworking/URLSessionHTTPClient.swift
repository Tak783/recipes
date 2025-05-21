//
//  URLSessionHTTPClient.swift
//  CoreNetworking
//

import Foundation

public final class URLSessionHTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    enum HTTPClientError: Error {
        case unexpectedURLResponseTypeError
    }
}

// MARK: - HTTPClient
extension URLSessionHTTPClient: HTTPClient {
    public func performRequest(_ request: URLRequest) async -> HTTPClient.Result {
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(HTTPClientError.unexpectedURLResponseTypeError)
            }
            return .success((data, httpResponse))
        } catch {
            return .failure(error)
        }
    }
}
