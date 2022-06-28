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
                        Text("title")
                    }
                    .padding()
                    HStack {
                        Text("Date")
                        Text("date")
                        Image(systemName: "calendar")
                    }
                    .padding()
                    HStack {
                        Text("Author")
                        Text("author")
                        Image(systemName: "person")
                    }
                    .padding()
                    HStack {
                        Text("Body")
                        Text("body")
                    }
                    .padding()
                    DetailedView()
                        .environmentObject(managerComment)
                }
            
                NavigationLink(destination: AddComment(post: post).navigationBarHidden(true))  {
                    Text("Add A Comment")
                }.environmentObject(managerComment)
                
            }
        }
    }
}
