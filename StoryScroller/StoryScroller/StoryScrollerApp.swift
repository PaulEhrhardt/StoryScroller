//
//  StoryScrollerApp.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import SwiftUI
import SwiftData


// MARK: - StoryScrollerApp -

@main
struct StoryScrollerApp: App {
    
    
    // MARK: - Properties
    
    @State var viewModel = StoryScrollerViewModel()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([StoryInfo.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    
    // MARK: - Lifecycle
    
    var body: some Scene {
        WindowGroup {
            StoryListView()
        }
        .modelContainer(sharedModelContainer)
        .environment(viewModel)
    }
}
