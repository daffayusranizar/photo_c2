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
    @State private var participants: [ParticipantModel] = AlbumModel.albums[0].participants
    @State private var offset: CGSize = .zero
    @State private var isAnimating: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                if stackedPhotos.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "photo.stack")
                            .font(.system(size: 60))
                            .foregroundStyle(.secondary)
                        
                        Text("No More Photos")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("You've gone through all the photos.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 340, height: 590)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 4)
                } else {
                    ForEach(Array(stackedPhotos.enumerated()), id: \.element.id) { index, photo in
                        let isTopCard = index == stackedPhotos.count - 1
                        let rotationAngle: Double = Double(index)
                        
                        Image(photo.fileName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 340, height: 590)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 4)
                            .overlay(alignment: .bottom) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("WHO'S IN THIS PHOTO?")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)

                                    HStack(spacing: 12) {
                                        ForEach(participants, id: \.id) { person in
                                            VStack(spacing: 4) {
                                                Image(person.profilePicture)
                                                    .resizable()
                                                    .frame(width: 44, height: 44)
                                                    .clipShape(Circle())
                                                    .overlay(Circle().stroke(.white, lineWidth: 2))
                                                Text(person.name)
                                                    .font(.caption2)
                                                    .foregroundStyle(.white)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                                .background {
                                        RoundedRectangle(cornerRadius: 0)
                                            .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                                            .foregroundStyle(.black.opacity(0.4))
                                }
                            }
                            .rotationEffect(
                                .degrees(isTopCard ? Double(offset.width / 10) : rotationAngle / 4),
                                anchor: .bottomTrailing
                            )
                            .offset(isTopCard ? offset : .zero)
                            .gesture(isTopCard ? dragGesture() : nil)
                    }
                }
            }

            Spacer()

     
            HStack{
                let firstPhoto = selectedAlbum.photos.first!
                Image(firstPhoto.fileName)
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: 60, height: 60)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 30)
            }
            
            
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { } label: {
                        Image(systemName: "chevron.left")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(selectedAlbum.albumName)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation(.easeInOut) { }
                    } label: {
                        Image(systemName: "arrow.uturn.backward")
                    }
                    .fontWeight(.semibold)
                }
            }
        }
    }

    private func dragGesture() -> some Gesture {
        DragGesture()
            .onChanged { gesture in
                guard !isAnimating else { return }
                offset = gesture.translation
            }
            .onEnded { gesture in
                guard !isAnimating else { return }
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
        guard !stackedPhotos.isEmpty, !isAnimating else { return }
        isAnimating = true
        withAnimation(.easeInOut(duration: 0.2)) {
            stackedPhotos.removeLast()
            offset = .zero
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            isAnimating = false
        }
    }
}

#Preview {
    PhotoSelectionView()
}
