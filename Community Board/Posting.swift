//
//  Posting.swift
//  Community Board
//
//  Created by csuftitan on 6/22/22.
//

import Foundation

class PostingManager: ObservableObject {
    @Published var PostList: [Post] = []

    init() {
        PostList.append(Post(author: "John", title: "Cleaning out garage", body: "There is a lot of junk. I got a lot of old trash that I don't want to throw away. Help me bring all this out to my public storage unit this Saturday around 5."))
        PostList.append(Post(author: "Sarah", title: "Planting flowers", body: "Let's make our neighborhood look pretty!"))
        PostList[1].comments.append(Comment(body: "What kind of flowers were you thinking of?", username: "Anna"))
        PostList[1].comments.append(Comment(body: "@Anna Azaleas! But open to other suggestions.", username: "Sarah"))
    }

    func makePost(newPost: Post) {
        PostList.append(newPost)
    }
}

class Post: Identifiable, ObservableObject {
    var id = UUID()
    var date: String
    var author: String
    var title: String
    var body: String
    var comments: [Comment] = []
    init(author: String, title: String, body: String) {
        self.author = author
        self.date = ""
        self.title = title
        self.body = body
        self.date = getDate()
    }

    func getDate() -> String {
        // get the current date and time
        let currentDateTime = Date()

        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .long

        // get the date time String from the date object
        return formatter.string(from: currentDateTime) // October 8, 2016 at 10:48:53 PM
    }
}
