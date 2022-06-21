//
//  ContentView.swift
//  Community Board
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var title: String = "TITLE"
    @State var name: String = "NAME"
    @State var location: String = "LOCATION"
    @State var phone: String = "PHONE"
    @State var description: String = "DESCRIPTION"
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Information about INSERT_PROJECT_TITLE")
                    .fontWeight(.heavy)
                    .fontWeight(.bold)
                    .padding()
                Info(title: $title, name: $name, location: $location, phone: $phone, description: $description)
                
                NavigationLink(destination: Comment()) {
                    Text("Add a comment")
                        .font(.caption)
                }.padding(.bottom, 30)
                
            }
        }
        
    }
}

struct Info: View {
    @Binding var title: String
    @Binding var name: String
    @Binding var location: String
    @Binding var phone: String
    @Binding var description: String
    var body: some View {
        Text(title)
        Text(name)
        Text(location)
        Text(phone)
        Text(description)
    }
}




struct Comment: View {
    @SceneStorage("commentSubject") var commentSubject: String = ""
    @SceneStorage("commentBody") var commentBody: String = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                Text("Crosswalk Submission")
                    .bold()
                    .font(.largeTitle)
                }
                .padding(.bottom, 30)

                HStack {
                    Text("Crosswalk Name")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Crosswalk address")
                        .bold()
                    Spacer()
                }
                {
                    Text("Submit")
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
