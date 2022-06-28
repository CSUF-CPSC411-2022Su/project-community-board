//
//  ContentView.swift
//  Community Board
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user = User(username: "", password: "")
    @AppStorage("username") var username = ""
    @AppStorage("password") var password = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @State var attemptedUsername = ""
    @State var attemptedPassword = ""
    @EnvironmentObject var postingManager: PostingManager
    @EnvironmentObject var managerComment: CommentManager
    var body: some View {
        if isLoggedIn {
            MainMenu(user: user).environmentObject(PostingManager())
        }
        else {
            SignIn(user: user).environmentObject(PostingManager())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PostingManager())
    }
}
