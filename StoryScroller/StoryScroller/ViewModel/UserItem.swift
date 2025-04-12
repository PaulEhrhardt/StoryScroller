//
//  UserItem.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import Foundation


// MARK: - UserItem -

struct UserItem: Identifiable, Hashable, Sendable {
    
    let id: UUID = UUID()
    let user: User
    
    var storyImageUrl: String {
        "https://picsum.photos/id/\(user.id)/200/300"
    }
    
    var isVisited: Bool = false
    var isLiked: Bool = false
}

