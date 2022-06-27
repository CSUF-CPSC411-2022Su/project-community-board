//
//  Modifiers.swift
//  Community Board
//
//  Created by csuftitan on 6/22/22.
//

import Foundation
import SwiftUI

struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}

struct TextEntry: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(1)
            .border(Color.blue)
            .background(Color.white)
    }
}
