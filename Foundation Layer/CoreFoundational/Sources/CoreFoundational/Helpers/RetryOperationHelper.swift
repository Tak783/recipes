//
//  RetryOperationHelper.swift
//  CoreFoundational
//
//  Created  26/04/2025.
//

import Foundation

@MainActor
public struct RetryOperationHelper {
    public static func retry(
        maxAttempts: Int = 3,
        delayBetweenAttempts delay: Duration = .seconds(1),
        operation: @escaping () async throws -> Void
    ) async throws {
        var attempt = 0
        var lastError: Error?

        while attempt < maxAttempts {
            do {
                try await operation()
                return
            } catch {
                lastError = error
                attempt += 1
                if attempt < maxAttempts {
                    try? await Task.sleep(for: delay)
                }
            }
        }

        throw lastError ?? NSError(
            domain: "RetryOperationHelper",
            code: -1,
            userInfo: [NSLocalizedDescriptionKey: "Unknown retry failure."]
        )
    }
}
