//
//  ErrorView.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import SwiftUI


// MARK: - ErrorView -

struct ErrorView: View {
    
    var body: some View {
        VStack {
            Spacer()
            Text("error_load_title")
                .font(.title)
            Text("error_load_message")
                .font(.body)
            Spacer()
        }
    }
}
