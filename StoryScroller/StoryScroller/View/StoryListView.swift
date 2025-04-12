//
//  StoryListView.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import SwiftUI


// MARK: - StoryListView -

struct StoryListView: View {
    
    
    // MARK: - Properties
    
    @Environment(\.modelContext) var modelContext
    @Environment(StoryScrollerViewModel.self) var viewModel
    
    let columns = [GridItem(.adaptive(minimum: 300))]
    
    
    // MARK: - Lifecycle
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.users, id: \.self) { userItem in
                        NavigationLink(destination: StoriesView(item: userItem)) {
                            UserView(item: userItem)
                        }
                    }
                    switch viewModel.state {
                    case .loading:
                        LoadingView()
                    case .loadingFailure:
                        ErrorView()
                    case .initial, .nextPage:
                        LoadingView()
                            .onAppear {
                                Task {
                                    await viewModel.loadNextPage()
                                }
                            }
                    }
                }
            }
        }
        .task {
            await viewModel.loadUsers()
        }
    }
}

#Preview {
    StoryListView()
        .environment(StoryScrollerViewModel())
}
