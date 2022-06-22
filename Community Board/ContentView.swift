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
    var body: some View {
        if isLoggedIn {
            MainMenu(user: user)
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
                        NavigationLink(destination: SignUp(user: user)) {
                            Text("Sign up").padding()
                        }
                        NavigationLink(destination: MainMenu(user: user).navigationBarHidden(true).onAppear(perform: {
                            username = user.username
                            isLoggedIn = true
                        })) {
                            Text("Log in").padding()
                        }.disabled(attemptedUsername != user.username || attemptedPassword != user.password || attemptedUsername == "" || attemptedPassword == "")
                    }
                    Spacer()
                }
            }
        }
    }
}

struct MainMenu: View {
    @AppStorage("username") var username = ""
    @AppStorage("password") var password = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @ObservedObject var user: User
    @State var projectName = "Planting Flowers"
    @State var projectType = "C"
    @State var projectDate = "June 13"
    @State var projectTime = "5:00 pm"
    @State var projectList = ProjectList()
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello \(username)!").font(.headline)
                Spacer()
                HStack(alignment: .top) {
                    Spacer().frame(maxWidth: 40)
                    Text(projectName)
                    Spacer()
                    Text(projectType)
                    Spacer().frame(maxWidth: 40)
                }
                HStack(alignment: .top) {
                    Spacer().frame(maxWidth: 40)
                    Text(projectDate)
                    Spacer()
                    Text(projectTime)
                    Spacer().frame(maxWidth: 40)
                }
                Spacer()
                VStack {
                    NavigationLink(destination: ContentView(user: user).navigationBarHidden(true).onAppear(perform: {
                        isLoggedIn = false
                    })) {
                        Text("Log out").padding()
                    }
                }
            }.background(Color.teal)
        }
    }
}

struct SignUp: View {
    @AppStorage("username") var username = ""
    @AppStorage("password") var password = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @ObservedObject var user: User
    @State var confirmPassword = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Enter username:")
                        .frame(width: 150, alignment: .leading).padding(.leading)
                    TextField("Username", text: $user.username)
                }
                HStack {
                    Text("Enter password:")
                        .frame(width: 150, alignment: .leading).padding(.leading)
                    SecureField("Password", text: $user.password)
                }
                HStack {
                    Text("Confirm password:")
                        .frame(width: 150, alignment: .leading).padding(.leading)
                    SecureField("Password", text: $confirmPassword)
                }
                Text("Note: Password must be at least 4 characters long.").font(.custom("", size: 14)).padding()
                NavigationLink(destination: MainMenu(user: user).navigationBarHidden(true).onAppear(perform: {
                    username = user.username
                })) {
                    Text("Sign up").padding()
                }.navigationBarHidden(true).disabled(user.username == "" || user.password.count < 4 ||
                           user.password != confirmPassword)
                // .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
