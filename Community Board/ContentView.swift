//
//  ContentView.swift
//  Community Board
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var user = User(username: "", password: "")
    @State var attemptedUsername = ""
    @State var attemptedPassword = ""
    var body: some View {
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
                    TextField("Password", text: $attemptedPassword)
                }
                HStack {
                    NavigationLink(destination: SignUp(user: user)) {
                        Text("Sign up").foregroundColor(Color.blue)
                    }
                    NavigationLink(destination: MainMenu(user: user)) {
                        Text("Log in")
                            .modifier(ButtonDesign())
                    }.disabled(attemptedUsername != user.username || attemptedPassword != user.password || attemptedUsername == "" || attemptedPassword == "")
                }
                Spacer()
            }
        }
    }
}

struct MainMenu: View {
    @ObservedObject var user: User
    @State var projectName = "Planting Flowers"
    @State var projectType = "C"
    @State var projectDate = "June 13"
    @State var projectTime = "5:00 pm"
    @State var projectList = ProjectList()
    var body: some View {
        VStack {
            Text("Hello \(user.username)!").font(.headline)
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
        }
    }
}

struct SignUp: View {
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
                    TextField("Password", text: $user.password)
                }
                HStack {
                    Text("Confirm password:")
                        .frame(width: 150, alignment: .leading).padding(.leading)
                    TextField("Password", text: $confirmPassword)
                }
                NavigationLink(destination: ContentView(user: user)) {
                    Text("Sign up").modifier(ButtonDesign())
                }.disabled(user.username == "" || user.password == "" ||
                           user.password != confirmPassword)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
