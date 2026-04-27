//
//  SharedAlbumView.swift
//  SharedPhotos
//
//  Created by Steve Agustinus on 20/04/26.
//

import SwiftUI

struct SharedAlbumView: View {
    
    @Environment(GridViewModel.self) private var store
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    @State private var showingNewAlbumSheet = false

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(store.albums) { album in
                        NavigationLink {
                            SharedAlbumGalleryView(album: album)
                        } label: {
                            AlbumCard(title: album.albumName, image: album.albumPhoto)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Shared Albums")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingNewAlbumSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingNewAlbumSheet) {
                CreateAlbumFormView()
            }
        }
    }
}

struct AlbumCard: View {
    let title: String
    let image: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            Color.clear
    
            Image(image)
                .resizable()
                .scaledToFill()
            
            Text(title)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .padding(20)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 4)
    }
}

#Preview {
    SharedAlbumView()
        .environment(GridViewModel()) 
}
