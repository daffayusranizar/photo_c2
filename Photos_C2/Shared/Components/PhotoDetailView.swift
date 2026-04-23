//
//  PhotoDetailView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 21/04/26.
//

import SwiftUI

import SwiftUI

struct PhotoDetailView: View {
    let imageInstance: PhotoModel

    @Environment(GridViewModel.self) private var viewModel
    @State private var currentPhoto: PhotoModel?
    @State private var scrollPosition: UUID?

    var body: some View {
        NavigationStack {
            Group {
                if let photo = currentPhoto {
                    Image(photo.fileName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.opacity) 
                        .id(photo.id)
                }
            }
            .animation(.easeInOut(duration: 0.2), value: currentPhoto)
            .safeAreaInset(edge: .bottom) {
                filmstrip
            }
            .gesture(swipeGesture)
            .onAppear {
                currentPhoto = imageInstance
                scrollPosition = imageInstance.id
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { } label: { Image(systemName: "ellipsis") }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button { } label: { Image(systemName: "square.and.arrow.up") }
                    Spacer()
                    Button { } label: { Image(systemName: "trash") }
                }
            }
        }
    }

    private var filmstrip: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(viewModel.images) { photo in
                        Image(photo.fileName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.white, lineWidth: photo.id == currentPhoto?.id ? 2 : 0)
                            )
                            .scaleEffect(photo.id == currentPhoto?.id ? 1.15 : 1.0)
                            .id(photo.id)
                            .onTapGesture {
                                currentPhoto = photo
                            }
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .scrollTargetBehavior(.viewAligned)
            .onChange(of: scrollPosition) { _, newId in
                guard let newId, newId != currentPhoto?.id else { return }
                if let match = viewModel.images.first(where: { $0.id == newId }) {
                    currentPhoto = match
                }
            }
            .onChange(of: currentPhoto) { _, newPhoto in
                guard let newPhoto, newPhoto.id != scrollPosition else { return }
                withAnimation(.spring(response: 0.3)) {
                    proxy.scrollTo(newPhoto.id, anchor: .center)
                    scrollPosition = newPhoto.id
                }
            }
        }
        .frame(height: 76)
    }

    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 50, coordinateSpace: .local)
            .onEnded { value in
                guard let current = currentPhoto,
                      let index = viewModel.images.firstIndex(where: { $0.id == current.id }) else { return }
                
                if value.translation.width < 0 {
                    let nextIndex = min(index + 1, viewModel.images.count - 1)
                    currentPhoto = viewModel.images[nextIndex]
                } else {
                    let prevIndex = max(index - 1, 0)
                    currentPhoto = viewModel.images[prevIndex]
                }
            }
    }
}

#Preview {
    PhotoDetailView(imageInstance: PhotoModel(fileName: "dummy_photo_1", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isFavorite: false))
        .environment(GridViewModel())
}
