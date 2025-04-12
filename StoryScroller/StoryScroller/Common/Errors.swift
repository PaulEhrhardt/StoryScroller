//
//  Errors.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import Foundation


// MARK: - Errors -

struct UnkonwnError: LocalizedError {
    var errorDescription: String? { String(reflecting: Self.self) }
}

struct NotFoundError: LocalizedError {
    var errorDescription: String? { String(reflecting: Self.self) }
}
