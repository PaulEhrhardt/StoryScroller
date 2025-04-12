//
//  Story.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import Foundation
import SwiftData


// MARK: - Story -

@Model
final class Story {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
