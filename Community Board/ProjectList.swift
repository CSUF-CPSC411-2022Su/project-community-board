//
//  ListView.swift
//  Community Board
//
//  Created by csuftitan on 6/8/22.
//

import Foundation
import SwiftUI

struct ProjectList: View {
    @EnvironmentObject var postingManager: PostingManager
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(postingManager.PostList) {
                        post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.largeTitle)
                            Text(post.body)
                                .font(.caption)
                        }
                    }
                }
            }
        }
    }
}
