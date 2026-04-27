//
//  SharedAlbumGalleryView.swift
//  SharedPhotos
//
//  Created by Steve Agustinus on 20/04/26.
//

import SwiftUI

struct SharedAlbumGalleryView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(GridViewModel.self) private var store
    
    @State private var isSelectMode = false
    
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
                    
                    NavigationLink(destination: PhotoSelectionView(albumId: album.id)) {
                        ZStack {
                            Image(album.albumPhoto)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 220)
                                .clipped()
                                Text("Review this album")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(.ultraThinMaterial)
                                    .clipShape(Capsule())
                            }
                    }
                    
                    ScrollView {
                        LazyVGrid(columns: store.columns, spacing: 1) {
                            ForEach(album.photos) { image in
                                if isSelectMode {
                                    SelectPhotoGridCellView(imageInstance: image, isSelected: false)
                                } else {
                                    PhotoGridCellView(imageInstance: image, albumId: album.id)
                                }
                            }
                        }
                    }
                    .simultaneousGesture(store.pinchGesture)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(album.albumName)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    withAnimation(.easeInOut) {
                        isSelectMode.toggle()
                    }
                } label: {
                    Text(isSelectMode ? "Cancel" : "Select")
                }
                .fontWeight(.semibold)
            }
        }
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
        .environment(GridViewModel())
}
