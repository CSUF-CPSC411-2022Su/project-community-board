//
//  DetailView.swift
//  Community Board
//
//  Created by csuftitan on 6/27/22.
//
import SwiftUI
import Foundation

struct DetailView: View {
    @StateObject var managerComment = CommentManager()
    @ObservedObject var post: Post
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                Text("Project Details")
                    .font(.title)
                    HStack {
                        Text("Title")
                        Text(post.title)
                    }
                    .padding()
                    HStack {
                        Text("Date")
                        Text(post.date)
                        Image(systemName: "calendar")
                    }
                    .padding()
                    HStack {
                        Text("Author")
                        Text(post.author)
                        Image(systemName: "person")
                    }
                    .padding()
                    HStack {
                        Text("Body")
                        Text(post.body)
                    }
                    .padding()
                    CommentListView()
                }
            
                NavigationLink(destination: AddComment(post: post).navigationBarHidden(true))  {
                    Text("Add A Comment")
                }
                
            }
        }.environmentObject(managerComment)
    }
}
