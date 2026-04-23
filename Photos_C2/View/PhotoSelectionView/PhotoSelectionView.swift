//
//  PhotoSelectionView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 22/04/26.
//

import SwiftUI

struct PhotoSelectionView: View {
    @State var selectedAlbum: AlbumModel = AlbumModel.albums[0]
    @State private var stackedPhotos: [PhotoModel] = AlbumModel.albums[0].photos
    
    // Track the current drag translation
    @State private var offset: CGSize = .zero

    var body: some View {
        ZStack {
            ForEach(stackedPhotos.indices, id: \.self) { index in
                let photo = stackedPhotos[index]
                let isTopCard = index == stackedPhotos.count - 1
                
               
                let rotationAngle: Double = Double(index)
                Image(photo.fileName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 4)
                    .rotationEffect(
                        .degrees(isTopCard ? Double(offset.width / 10) : rotationAngle/4), anchor: .bottomTrailing
                    )
                    .offset(isTopCard ? offset : .zero)
                    .gesture(isTopCard ? dragGesture() : nil)
            }
        }
    }

    private func dragGesture() -> some Gesture {
        DragGesture()
            .onChanged { gesture in
                offset = gesture.translation
            }
            .onEnded { gesture in
                if abs(gesture.translation.width) > 150 {
                    removeCard()
                } else {
                    withAnimation(.spring()) {
                        offset = .zero
                    }
                }
            }
    }

    private func removeCard() {
        withAnimation(.easeInOut(duration: 0.2)) {
            stackedPhotos.removeLast()
            offset = .zero
        }
    }
}

#Preview {
    PhotoSelectionView()
}
