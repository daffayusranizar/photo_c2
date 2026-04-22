//
//  PhotoDetailView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 21/04/26.
//

import SwiftUI

struct PhotoDetailView: View {
    let imageName: String

    @Environment(GridViewModel.self) private var viewModel
    @State private var currentImage: String = ""
    @State private var scrollPosition: String?
    @State private var isUserScrolling = false

    var body: some View {
        NavigationStack {
            Image(currentImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .animation(.easeInOut(duration: 0.2), value: currentImage)
                .safeAreaInset(edge: .bottom) {
                    filmstrip
                }
                .gesture(swipeGesture)
                .onAppear {
                    currentImage = imageName
                    scrollPosition = imageName
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button { } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button { } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        Spacer()
                        Button { } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            
        }
        
    }


    private var filmstrip: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.white, lineWidth: image == currentImage ? 2 : 0)
                            )
                            .scaleEffect(image == currentImage ? 1.15 : 1.0)
                            .animation(.spring(response: 0.3), value: currentImage)
                            .id(image)
                            .onTapGesture {
                                currentImage = image
                            }
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .scrollTargetBehavior(.viewAligned)
            .onChange(of: scrollPosition) { _, newPosition in
                guard let newPosition, newPosition != currentImage else { return }
                currentImage = newPosition
            }
            
            .onChange(of: currentImage) { _, newImage in
                guard newImage != scrollPosition else { return }
                withAnimation(.spring(response: 0.3)) {
                    proxy.scrollTo(newImage, anchor: .center)
                    scrollPosition = newImage
                }
            }
        }
        .frame(height: 76)
     
    }

    

    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 50, coordinateSpace: .local)
            .onEnded { value in
                let index = viewModel.images.firstIndex(of: currentImage) ?? 0
                if value.translation.width < 0 {
                    let next = min(index + 1, viewModel.images.count - 1)
                    currentImage = viewModel.images[next]
                } else {
                    let prev = max(index - 1, 0)
                    currentImage = viewModel.images[prev]
                }
            }
    }
}

#Preview {
    PhotoDetailView(imageName: "dummy_photo_1")
        .environment(GridViewModel())
}
