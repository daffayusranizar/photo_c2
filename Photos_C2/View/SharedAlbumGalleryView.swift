//
//  SharedAlbumGalleryView.swift
//  SharedPhotos
//
//  Created by Steve Agustinus on 20/04/26.
//

import SwiftUI

struct SharedAlbumGalleryView: View {
    @Environment(\.dismiss) var dismiss
        
    let album: AlbumModel
    @State private var columnCount: Double = 3
    @State private var lastColumnCount: Double = 3
    @State private var isPinching = false
    var columns: [GridItem] {
        Array(
            repeating: GridItem(.flexible(), spacing: 1),
            count: Int(round(columnCount))
        )
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(album.participants) { participant in
                                ParticipantAvatar(imageName: participant.profilePicture, name: participant.name)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 16)
                    
                    ZStack {
                        Image(album.albumPhoto)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 220)
                            .clipped()
                        
                        Button(action: {
                            // Review action
                        }) {
                            Text("Review this album")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(.ultraThinMaterial)
                                .clipShape(Capsule())
                        }
                    }
                    
                    LazyVGrid(columns: columns, spacing: 1) {
                        ForEach(album.photos) { image in
                            Image(image.fileName)
                                .resizable()
                                .border(Color.black.opacity(0.9), width: isPinching ? 4 : 0)
                                .aspectRatio(contentMode: .fill)
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .aspectRatio(1, contentMode: .fit)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 2))
                        }
                    }
                }
            }
        }
        .navigationTitle(album.albumName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ParticipantAvatar: View {
    let imageName: String
    let name: String
    
    var body: some View {
        VStack(spacing: 6) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(name)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    SharedAlbumGalleryView(album: AlbumModel.albums.first!)
}
