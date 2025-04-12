//
//  ModelContext+Convenience.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import SwiftData


// MARK: - Extension: ModelContext -

extension ModelContext {

    @MainActor
    func addStory(story: StoryInfo) {
        let newStory = StoryInfo(userId: story.userId, storySeen: story.storySeen, storyLiked: story.storyLiked)
        self.insert(newStory)
        try? self.save()
    }

    @MainActor
    func deleteStory(story: StoryInfo) {
        for story in allStories() where story.userId == story.userId {
            self.delete(story)
            try? self.save()
            break
        }
    }

    @MainActor
    func allStories() -> [StoryInfo] {
        let fetchDescriptor = FetchDescriptor<StoryInfo>()
        guard let stories = try? self.fetch(fetchDescriptor) else { return [] }
        return stories
    }
    
    @MainActor
    func getStory(by identifier: Int) -> StoryInfo? {
        return allStories()
            .first { story in
                 story.userId == identifier
            }
    }
}
