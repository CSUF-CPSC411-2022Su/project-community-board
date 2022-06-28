import SwiftUI

struct CommentListView: View {
    @EnvironmentObject var managerComment: CommentManager
    @ObservedObject var post: Post
    var body: some View {
        VStack (alignment: .center){
            List {
                ForEach(post.comments) {
                    comment in
                    VStack (alignment: .leading) {
                        Text(comment.subject)
                            .font(.title3)
                        
                        if(comment.username == "") {
                            Text(comment.username)
                                .font(.footnote)
                        }
                        else {
                            Text("@\(comment.username) - \(comment.date)")
                                .font(.footnote)
                        }
                        Text(comment.body)
                            .font(.body)
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
    @ObservedObject var post: Post
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
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Comment Subject", text: $commentSubject)
                        .modifier(TextEntry())
                    Spacer()
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Username")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Username", text: $commentUsername)
                        .modifier(TextEntry())
                    Spacer()
                }
                .padding(.bottom, 20)
                HStack {
                    Text("Comment Body")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                TextField("Body", text: $commentBody)
                    .modifier(TextEntry())
                
                NavigationLink(destination: DetailView(post: post).navigationBarHidden(true))  {
                    Text("Submit")
                }.simultaneousGesture(TapGesture().onEnded{
                    post.comments.append(Comment(subject: commentSubject, body: commentBody, username: commentUsername))
                    commentSubject = ""
                    commentBody = ""
                    commentUsername = ""
                })
            }
            .padding()
        }
    }
}
