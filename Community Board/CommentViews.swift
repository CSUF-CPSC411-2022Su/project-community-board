import SwiftUI

struct CommentListView: View {
    @EnvironmentObject var managerComment: CommentManager
    @ObservedObject var post: Post
    var body: some View {
        VStack(alignment: .center) {
            List {
                ForEach(post.comments) {
                    comment in
                    VStack(alignment: .leading) {
                        if comment.username == "" {
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
    @AppStorage("commentBody") var commentBody: String = ""
    @AppStorage("commentUsername") var commentUsername: String = ""
    @ObservedObject var user: User
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
                TextEditor(text: $commentBody)
                    .modifier(TextEntry())
                HStack {
                    NavigationLink(destination: DetailView(user: user, post: post).navigationBarHidden(true)) {
                        Text("Cancel").padding()
                    }
                    NavigationLink(destination: DetailView(user: user, post: post).navigationBarHidden(true)) {
                        Text("Submit").padding()
                    }.simultaneousGesture(TapGesture().onEnded {
                        post.comments.append(Comment(body: commentBody, username: user.username))
                        commentBody = ""
                    })
                }
            }
            .padding()
        }
    }
}
