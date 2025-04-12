//
//  StoryScrollerViewModel.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import Foundation
import Observation


// MARK: - StoryScrollerViewModel -

@Observable
class StoryScrollerViewModel {
    
    
    // MARK: - Types
    
    enum State {
        case initial, loading, nextPage, loadingFailure
    }
    
    
    // MARK: - Properties
    
    @MainActor var state: State = .initial
    @MainActor var users: [UserItem] = []
    
    @ObservationIgnored var contentProvider = ContentProvider()
    
    
    // MARK: - API
    
    func loadUsers() async {
        do {
            try await contentProvider.loadStoryFeed()
            setState(.nextPage)
        } catch {
            print(String(String(describing: error)))
            setState(.loadingFailure)
        }
    }
    
    func loadNextPage() async {
        setState(.loading)
        
        guard let page = await contentProvider.fetchNextPage() else {
            setState(.loadingFailure)
            return
        }
        guard !page.users.isEmpty else { return }
        
        // Wrap decoded User in an Identifiable Model to allow infinite scrolling with same content repeated
        let userItems = page.users.map { UserItem(user: $0) }
        appendUsers(userItems)
        
        setState(.nextPage)
    }
    
    
    // MARK: - Internal

    private func setState(_ newState: State) {
        Task { @MainActor in
            state = newState
        }
    }
    
    private func appendUsers(_ newUsers: [UserItem]) {
        Task { @MainActor in
            users.append(contentsOf: newUsers)
            print("User stories count: \(users.count)")
        }
    }
}

