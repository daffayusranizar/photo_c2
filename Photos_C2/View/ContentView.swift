import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Shared", systemImage: "person.2.crop.square.stack.fill") {
                SharedAlbumView()
            }
            Tab("Personal", systemImage: "person.crop.rectangle.stack.fill") {
//                PersonalAlbumView()
            }
            Tab(role: .search) { }
        }
    }
}

#Preview {
    ContentView()
}
