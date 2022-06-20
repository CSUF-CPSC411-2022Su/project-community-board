//
//  User.swift
//  Community Board
//
//  Created by csuftitan on 6/20/22.
//

import Foundation
import SwiftUI

class User: ObservableObject {
    @Published var username: String
    @Published var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
