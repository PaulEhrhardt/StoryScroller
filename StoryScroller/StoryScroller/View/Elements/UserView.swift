//
//  UserView.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import SwiftUI


// MARK - UserView -

struct UserView: View {
    
    
    var item: UserItem
    
    var imageUrl: URL {
        URL(string: item.user.profilePictureURL) ?? Bundle.main.url(forResource: "dummyImage", withExtension: "png")!
    }

    var wasVisited: Bool
    
    var background: Color {
        wasVisited ? .orange : .teal
    }
    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                        )
                        .shadow(radius: 10)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 250, height: 250)
                
                VStack {
                    Spacer()
                        .frame(width: 250, height: 170)
                    Text(item.user.name)
                        .bold()
                        .foregroundStyle(.white)
                }
                .frame(width: 250, height: 250)
            }
        }
        .padding()
        .background(.teal)
        .clipShape(Circle())
    }
}

#Preview {
    UserView(item: UserItem(user: User(id: 111, name: "Commander Thadeus", profilePictureURL: "https://picsum.photos/200")), wasVisited: false)
}
