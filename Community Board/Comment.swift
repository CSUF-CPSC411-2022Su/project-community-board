import Foundation
import SwiftUI

class CommentManager: ObservableObject {
    @Published var comments: [Comment] = []
    
    init() {
        comments.append(Comment(subject: "Comments", body: "", username: ""))
    }
}

struct Comment: Identifiable {
    var id = UUID()
    var subject: String
    var body: String
    var username: String
    var date: String
    
    init(subject: String, body: String, username: String){
        self.subject = subject
        self.body = body
        self.username = username
        self.date = ""
        self.date = getDate()
        
    }
    
    func getDate() -> String
    {
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
