//
//  HTTPClientSpy.swift
//  MockNetworking
//
//  Created by Tak Mazarura on 21/05/2025.
//

import Foundation
import CoreNetworking

import Foundation
import CoreNetworking
import Foundation
import CoreNetworking

public final class HTTPClientSpy: HTTPClient {
    public enum StatusCode: Int {
        case success = 200
        case error = 400
    }

    // Store each request with its continuation (like a saved completion block)
    private struct Message {
        let request: URLRequest
        let continuation: CheckedContinuation<HTTPClient.Result, Never>
    }

    private var messages: [Message] = []

    public var requests: [URLRequest] {
        messages.map { $0.request }
    }

    public init() {}

    // ✅ Step 1: Save continuation (like a pending task)
    // ✅ Step 2: Wait for it to be resumed
    public func performRequest(_ request: URLRequest) async -> HTTPClient.Result {
        return await withCheckedContinuation { continuation in
            let message = Message(request: request, continuation: continuation)
            messages.append(message)
            // Now performRequest is suspended until continuation is resumed externally
        }
    }

    // ✅ Step 3: Complete the task externally — success
    public func complete(withStatusCode code: Int = StatusCode.success.rawValue, data: Data, at index: Int = 0) {
        guard index < messages.count else {
            assertionFailure("No message at index \(index)")
            return
        }

        guard let url = messages[index].request.url else {
            assertionFailure("Missing URL in request")
            return
        }

        let response = HTTPURLResponse(
            url: url,
            statusCode: code,
            httpVersion: nil,
            headerFields: nil
        )!

        messages[index].continuation.resume(returning: .success((data, response)))
    }

    // ✅ Step 3: Complete the task externally — failure
    public func complete(with error: Error, at index: Int = 0) {
        guard index < messages.count else {
            assertionFailure("No message at index \(index)")
            return
        }

        messages[index].continuation.resume(returning: .failure(error))
    }
}

extension HTTPClientSpy {
    public func waitForRequest(timeout: TimeInterval = 1.0) async throws {
        let deadline = Date().addingTimeInterval(timeout)
        while messages.isEmpty {
            if Date() > deadline {
                throw NSError(domain: "Timeout", code: 1)
            }
            try await Task.sleep(nanoseconds: 10_000_000)
        }
    }
}
