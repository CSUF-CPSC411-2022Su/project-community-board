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
}
