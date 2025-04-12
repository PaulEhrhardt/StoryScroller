//
//  StoriesView.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import SwiftUI


// MARK: - StoriesView -

struct StoriesView: View {
    
    
    // MARK: - Properties
    
    @Environment(\.modelContext) var modelContext
    @State var isLiked: Bool = false
    @State var info: StoryInfo = StoryInfo(userId: -1, storySeen: false, storyLiked: false)
    
    var item: UserItem
    
    var imageUrl: URL {
        URL(string: item.storyImageUrl) ?? Bundle.main.url(forResource: "dummyImage", withExtension: "png")!
    }

    
    // MARK: - Lifecycle
    
    var body: some View {
        ZStack(alignment: .center) {
            
            AsyncImage(url: imageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                LoadingView()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack(spacing: 16) {
                        Text("storie_like_text_name_\(item.user.name)")
                        
                        Button {
                            isLiked.toggle()
                            changeLikedStatus(isLiked)
                        } label: {
                            Image(systemName: info.storyLiked ? "heart.fill" : "heart")
                                .font(.largeTitle)
                                .foregroundStyle(.red)
                                .symbolEffect(.pulse, options: .default, value: isLiked)
                        }
                    }
                    .padding(12)
                    
                    Spacer()
                }
                .background(.ultraThinMaterial)
            }
        }
        .onAppear {
            let defaultInfo = StoryInfo.init(userId: item.user.id, storySeen: true, storyLiked: false)
            info = defaultInfo
            Task {
                info = modelContext.getStory(by: item.user.id) ?? defaultInfo
            }
        }
        .onDisappear {
            modelContext.addStory(story: self.info)
        }
    }
    
    private func changeLikedStatus(_ liked: Bool) {
        let updatedStory = StoryInfo(userId: info.userId, storySeen: true, storyLiked: liked)
        modelContext.deleteStory(story: info)
        modelContext.addStory(story: updatedStory)
        info = updatedStory
    }
}

#Preview {
    StoriesView(item: UserItem(user: User(id: 111, name: "Commander Thadeus", profilePictureURL: "https://picsum.photos/200")))
}
