//
//  AddRequestView.swift
//  Community Board
//
//  Created by csuftitan on 6/20/22.
//

import SwiftUI

struct AddRequestView: View {
    @EnvironmentObject var manager: PostingManager
    @AppStorage("postTitle") var postTitle: String = ""
    @AppStorage("postBody") var postBody: String = ""
    @ObservedObject var user: User
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Text("Make a post")
                    HStack { // Variation 2
                        Text("Title: ")
                            .frame(width: 100)
                            .border(Color.black)
                        TextField("Title", text: $postTitle)
                            .frame(width: 200)
                            .border(Color.black)
                        Spacer()
                    }
                    HStack { // Variation 2
                        Text("Body: ")
                            .frame(width: 100)
                            .border(Color.black)
                        TextEditor(text: $postBody)
                            .frame(width: 200)
                            .border(Color.black)
                        Spacer()
                    }
                    
                    Button(action: {
                        manager.makePost(newPost: Post(author: user.username, title: postTitle, body: postBody))
                        postBody = ""
                        postTitle = ""
                    }) {
                        Text("Submit")
                            .modifier(ButtonDesign())
                    }
                    
                }.frame(height: geometry.size.height / 2)
                
                VStack{
                }
                
            }
        }
    }
}
struct EditableCrosswalkList: View {
    @EnvironmentObject var manager: PostingManager
    var body: some View {
        VStack {
            // TODO: Model 3 - Add the EditButton here
            EditButton()

            List {
                /// ForEach requires each element in the collection it traverses to be Identifiable
                // TODO: Model 2 - Add the onDelete method below
                ForEach(manager.PostList) {
                    crosswalk in
                    VStack (alignment: .leading) {
                        Text(crosswalk.date)
                            .font(.largeTitle)
                        Text(crosswalk.body)
                            .font(.caption)
                    }
                }.onDelete {
                    offset in
                    manager.PostList.remove(atOffsets: offset)
                }.onMove {
                    offset, index in
                    manager.PostList.move(fromOffsets: offset,
                                            toOffset: index)
                }


                // TODO: Model 3 - Add the onMove method below

            }
        }
    }
}

//struct AddRequestView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRequestView()
//    }
//}
