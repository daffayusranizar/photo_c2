import SwiftUI

struct ContentView: View {
    @Binding var personalAlbum: AlbumModel
    var body: some View {
        TabView {
            Tab("Shared", systemImage: "person.2.crop.square.stack.fill") {
                SharedAlbumView()
            }
            Tab("Personal", systemImage: "person.crop.rectangle.stack.fill") {
                PersonalAlbumView(personalAlbum: $personalAlbum)
            }
            Tab(role: .search) { }
        }
    }
}

#Preview {
    ContentView(personalAlbum: .constant(AlbumModel.personalAlbums))
        .environment(GridViewModel())
}
