//
//  MainMenuView.swift
//  Community Board
//
//  Created by csuftitan on 6/27/22.
//

import Foundation
import SwiftUI

struct MainMenu: View {
    @AppStorage("username") var username = ""
    @AppStorage("password") var password = ""
    @AppStorage("isLoggedIn") var isLoggedIn = true
    @ObservedObject var user: User
    @EnvironmentObject var manager: PostingManager
    
    @State var projectName = "Planting Flowers"
    @State var projectType = "C"
    @State var projectDate = "June 13"
    @State var projectTime = "5:00 pm"
    @State var projectList = ProjectList()
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(manager.PostList) {
                        post in
                        VStack (alignment: .leading) {
                            Text(post.title)
                                .font(.largeTitle)
                            Text(post.body)
                                .font(.caption)
                        }
                    }
                }
                NavigationLink(destination: ContentView(user: user).navigationBarHidden(true).onAppear(perform: {
                    isLoggedIn = false
                })) {
                    Text("Log out").padding()
                }
            }.environmentObject(PostingManager())
        }
    }
}
