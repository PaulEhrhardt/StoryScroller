//
//  StoryFeed.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//


import Foundation


// MARK: - StoryFeed -

struct StoryFeed: Codable, Sendable {
    let pages: [Page]
}


// MARK: - Page -

struct Page: Codable, Sendable {
    let users: [User]
}


// MARK: - User -

struct User: Hashable, Codable, Sendable {
    
    let id: Int
    let name: String
    let profilePictureURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePictureURL = "profile_picture_url"
    }
}
