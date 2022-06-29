//
//  AddRequestView.swift
//  Community Board
//
//  Created by csuftitan on 6/20/22.
//

import SwiftUI

struct AddRequestView: View {
    @EnvironmentObject var manager: PostingManager
    @AppStorage("postTitle") var postTitle: String = ""
    @AppStorage("postBody") var postBody: String = ""
    @ObservedObject var user: User
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text("Make a post").font(.largeTitle)
                    HStack {
                        Spacer()
                        Text("Title: ")
                            .frame(width: 100)
                            .border(Color.black)
                        TextField("Title", text: $postTitle)
                            .frame(width: 250)
                            .border(Color.black)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Text("Body: ")
                            .frame(width: 100)
                            .border(Color.black)
                        TextEditor(text: $postBody)
                            .frame(width: 250)
                            .border(Color.black)
                        Spacer()
                    }
                    Button(action: {
                        manager.makePost(newPost: Post(author: user.username, title: postTitle, body: postBody))
                        postBody = ""
                        postTitle = ""
                    }) {
                        Text("Submit")
                            .modifier(ButtonDesign())
                    }
                }.frame(height: 3 * geometry.size.height / 4)
            }
        }
    }
}
