//
//  OnMainThread.swift
//  BreakFree
//
//  Created  16/04/2025.
//

public func peformOnMainThread(_ block: @Sendable @escaping @MainActor () -> Void) {
    Task { await MainActor.run(body: block) }
}
