//
//  DetailView.swift
//  Community Board
//
//  Created by csuftitan on 6/27/22.
//
import Foundation
import SwiftUI

struct DetailView: View {
    @StateObject var managerComment = CommentManager()
    @ObservedObject var user: User
    @ObservedObject var post: Post
    var body: some View {
        VStack {
            VStack {
                Text("Project Details")
                    .font(.title)
                HStack {
                    Text(post.title).font(.headline)
                }
                .padding()
                HStack {
                    Image(systemName: "calendar")
                    Text(post.date)
                }
                .padding()
                HStack {
                    Image(systemName: "person")
                    Text(post.author)
                }
                .padding()
                HStack {
                    Text(post.body).frame(width: 350).lineLimit(10)
                }
                CommentListView(post: post)
            }
            HStack {
                NavigationLink(destination: MainMenu(user: user, post: post).navigationBarHidden(true)) {
                    Text("Back").padding()
                }
                NavigationLink(destination: AddComment(user: user, post: post).navigationBarHidden(true)) {
                    Text("Add comment").padding()
                }
            }
        }.environmentObject(managerComment)
    }
}
