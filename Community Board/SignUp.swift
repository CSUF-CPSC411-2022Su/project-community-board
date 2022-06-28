//
//  SignUpView.swift
//  Community Board
//
//  Created by csuftitan on 6/27/22.
//

import Foundation
import SwiftUI

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
                HStack {
                    NavigationLink(destination: ContentView(user: user).navigationBarHidden(true)) {
                        Text("Cancel").padding()
                    }
                    NavigationLink(destination: MainMenu(user: user).environmentObject(PostingManager()).navigationBarHidden(true).onAppear(perform: {
                        username = user.username
                        password = user.password
                    })) {
                        Text("Sign up").padding()
                    }.disabled(user.username == "" || user.password.count < 4 ||
                               user.password != confirmPassword)
                }
            }
        }
    }
}
