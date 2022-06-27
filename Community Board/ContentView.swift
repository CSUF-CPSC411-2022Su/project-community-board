import SwiftUI

struct ContentView: View {
    @StateObject var manager = CommentManager()
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                Text("Project Details")
                    .font(.title)
                    HStack {
                        Text("Title")
                        Text("Title of project")
                    }
                    .padding()
                    HStack {
                        Text("Date")
                        Text("Date of project")
                    }
                    .padding()
                    HStack {
                        Text("Author")
                        Text("Author of project")
                    }
                    .padding()
                    HStack {
                        Text("Body")
                        Text("Body of project")
                    }
                    .padding()
                }
                TabView {
                    DetailedView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Detailed View")
                        }
                    
                    AddComment()
                        .tabItem {
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                            Text("Add A Comment")
                        }
                }.environmentObject(manager)
                
                NavigationLink(destination: AddComment())  {
                    Text("Add A Comment")
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
