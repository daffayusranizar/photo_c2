import SwiftUI

struct SharedAlbumView: View {
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    AlbumCard(title: "Apple Developer Academy 🍎", image: "academy_wall")
                    AlbumCard(title: "Academy Eats!", image: "academy_food")
                    AlbumCard(title: "Academy Bali Trips", image: "academy_bali")
                }
                .padding()
            }
            .navigationTitle("Shared Albums")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        
                        Button { } label: {
                            Label("View Options", systemImage: "rectangle.stack.badge.person.crop")
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct AlbumCard: View {
    let title: String
    let image: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Placeholder for your image
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(colors: [.gray, .black.opacity(0.8)], startPoint: .top, endPoint: .bottom))
                .aspectRatio(0.7, contentMode: .fit) // Vertical card ratio
            
            Text(title)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .padding(10)
                .lineLimit(2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    SharedAlbumView()
}
