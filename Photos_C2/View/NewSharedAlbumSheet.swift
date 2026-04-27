//
//  NewSharedAlbumSheet.swift
//  SharedPhotos
//
//  Created by Steve Agustinus on 21/04/26.
//


import SwiftUI

struct NewSharedAlbumSheet: View {
    
    @Environment(GridViewModel.self) private var store
    @Environment(\.dismiss) var dismiss
    
    @State private var albumName: String = ""
    @State private var hasCoverPhoto: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Button {
                        hasCoverPhoto.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.secondary.opacity(0.15))
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                            
                            VStack(spacing: 12) {
                                Image(systemName: hasCoverPhoto ? "photo.fill" : "photo.badge.plus")
                                    .font(.system(size: 40))
                                Text(hasCoverPhoto ? "Change Cover Photo" : "Add Cover Photo")
                                    .font(.headline)
                            }
                            .foregroundColor(.blue)
                        }
                    }
                    .buttonStyle(.plain)
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                .padding(.bottom, 10)
                
                Section {
                    TextField("Shared Album Name", text: $albumName)
                        .clearButton(text: $albumName)
                } footer: {
                    
                }
                Section {
                    Button {
                        // Action to present contact picker
                    } label: {
                        Label("Add Participants", systemImage: "person.crop.circle.badge.plus")
                    }
                } footer: {
                    Text("Invitation will be sent from Steve Agustinus (steve0408.sa@gmail.com)")
                }
            }
            .navigationTitle("New Shared Album")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button() {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create") {
                        let newAlbum = AlbumModel(
                            albumName: albumName,
                            albumPhoto: "person_2",
                            photos: [],
                            participants: []
                        )
                        store.addAlbum(newAlbum) // ← calls the function
                        dismiss()
                    }
                    .bold()
                    .foregroundStyle(.blue)
                    .disabled(albumName.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
        .presentationDetents([.large, .large])
    }
}

extension View {
    func clearButton(text: Binding<String>) -> some View {
        self.modifier(ClearButton(text: text))
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        HStack {
            content
            if !text.isEmpty {
                Button(action: { self.text = "" }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
