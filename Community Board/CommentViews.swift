import SwiftUI

struct DetailedView: View {
    @EnvironmentObject var managerComment: CommentManager
    var body: some View {
        VStack (alignment: .center){
            List {
                ForEach(managerComment.comments) {
                    comment in
                    VStack (alignment: .leading) {
                        Text(comment.subject)
                            .font(.largeTitle)
                        
                        if(comment.username == "") {
                            Text(comment.username)
                                .font(.subheadline)
                        }
                        else {
                            Text("@" + comment.username)
                                .font(.subheadline)
                        }
                        Text(comment.body)
                            .font(.caption)
                    }
                }
            }
            
        }
        .environmentObject(managerComment)
    }
}

struct AddComment: View {
    @AppStorage("commentSubject") var commentSubject: String = ""
    @AppStorage("commentBody") var commentBody: String = ""
    @AppStorage("commentUsername") var commentUsername: String = ""
    @EnvironmentObject var managerComment: CommentManager
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Comment Submission")
                        .bold()
                        .font(.largeTitle)
                }
                HStack {
                    Text("Comment Subject")
                        .bold()
//                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Comment Subject", text: $commentSubject)
                        .modifier(TextEntry())
//                    Spacer()
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Username")
                        .bold()
//                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Username", text: $commentUsername)
                        .modifier(TextEntry())
//                    Spacer()
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Comment Body")
                        .bold()
//                    Spacer()
                }
                .padding(.bottom, 5)
                TextField("Body", text: $commentBody)
                    .modifier(TextEntry())

                NavigationLink(destination: DetailView().navigationBarHidden(true))  {
                    Text("Submit")
                }.simultaneousGesture(TapGesture().onEnded{
                    managerComment.comments.append(Comment(subject: "commentSubject", body: "commentBody", username: "commentUsername"))
                    commentSubject = ""
                    commentBody = ""
                    commentUsername = ""
                })
                
//                Button(action: {
//                    managerComment.comments.append(Comment(subject: commentSubject, body: commentBody, username: commentUsername))
//                    commentSubject = ""
//                    commentBody = ""
//                    commentUsername = ""
//                }) {
//                    Text("Submit")
//                        .modifier(ButtonDesign())
//                }

            }
            .padding()
        }
    }
}
