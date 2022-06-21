//
//  ContentView.swift
//  Community Board
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var title: String = "Plant Trees In The Park"
    @State var name: String = "Sally B."
    @State var location: String = "Hyde Park"
    @State var phone: String = "555-555-5555"
    @State var description: String = "We are planting trees in the park to help the community grow."
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(alignment: .leading) {
                    Text("Planting Trees In The Park")
                        .fontWeight(.heavy)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .frame(height: geometry.size.height / 3)
                    
                    Info(title: $title, name: $name, location: $location, phone: $phone, description: $description)
//                        .frame(width: 300)
                    
                    NavigationLink(destination: Comment()) {
                        Text("Add A Comment")
                            .font(.caption)

                        
                    }.padding(.bottom, 30)
                        .frame(height: geometry.size.height / 2)
                }
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
                    Text("Add A Comment")
                        .bold()
                        .font(.largeTitle)
                }
                .padding(.bottom, 30)
                
                HStack {
                    Text("Subject")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                
                .padding(.bottom, 20)
                HStack {
                    Text("Body")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                
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
