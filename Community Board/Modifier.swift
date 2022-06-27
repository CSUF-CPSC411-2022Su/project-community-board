import SwiftUI

struct TextEntry: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(1)
            .border(Color.blue)
            .background(Color.white)
    }
}

struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }
}

