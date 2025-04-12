//
//  StoryInfo.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import Foundation
import SwiftData


// MARK: - StoryInfo -

@Model
final class StoryInfo {
    
    var updatded: Date
    var userId: Int
    var storySeen: Bool
    var storyLiked: Bool
    
    init(userId: Int, storySeen: Bool, storyLiked: Bool) {
        self.userId = userId
        self.storySeen = storySeen
        self.storyLiked = storyLiked
        self.updatded = .now
    }
}
