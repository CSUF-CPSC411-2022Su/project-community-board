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
    @EnvironmentObject var manager: PostingManager
    var body: some View {
        if isLoggedIn {
            MainMenu(user: user).environmentObject(PostingManager())
        }
        else {
            NavigationView {
                VStack {
                    Text("Welcome to Community Board!").font(.headline)
                    Spacer()
                    HStack {
                        Text("Username:")
                            .frame(width: 90, alignment: .leading).padding(.leading)
                        TextField("Username", text: $attemptedUsername)
                    }
                    HStack {
                        Text("Password:")
                            .frame(width: 90, alignment: .leading).padding(.leading)
                        SecureField("Password", text: $attemptedPassword)
                    }
                    HStack {
                        NavigationLink(destination: SignUp(user: user).navigationBarHidden(true)) {
                            Text("Sign up").padding()
                        }
                        NavigationLink(destination: MainMenu(user: user).environmentObject(PostingManager()).navigationBarHidden(true).onAppear(perform: {
                            username = user.username
                            password = user.password
                            isLoggedIn = true
                        })) {
                            Text("Log in").padding()
                        }.disabled(attemptedUsername != username || attemptedPassword != password || attemptedUsername == "" || attemptedPassword == "")
                    }
                    Spacer()
                }.environmentObject(PostingManager())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PostingManager())
    }
}
