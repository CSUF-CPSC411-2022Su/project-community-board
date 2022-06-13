//
//  ContentView.swift
//  Community Board
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var projectName = "Planting Flowers"
    @State var projectType = "C"
    @State var projectDate = "June 13"
    @State var projectTime = "5:00 pm"
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Spacer().frame(maxWidth: 40)
                Text(projectName)
                Spacer()
                Text(projectType)
                Spacer().frame(maxWidth: 40)
                
            }
            HStack(alignment: .top) {
                Spacer().frame(maxWidth: 40)
                Text(projectDate)
                Spacer()
                Text(projectTime)
                Spacer().frame(maxWidth: 40)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
