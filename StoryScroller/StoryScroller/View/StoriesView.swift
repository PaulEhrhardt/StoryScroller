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
                        } label: {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
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
    }
}

#Preview {
    StoriesView(item: UserItem(user: User(id: 111, name: "Commander Thadeus", profilePictureURL: "https://picsum.photos/200")))
}
