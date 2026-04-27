//
//  PersonalAlbumView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 20/04/26.
//

import SwiftUI

struct PersonalAlbumView: View {
    @Environment(GridViewModel.self) private var store

    @State private var isSelectMode = false

    @Binding var personalAlbum: AlbumModel

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: store.columns, spacing: 1) {
                    ForEach(personalAlbum.photos, id: \.id) { image in
                        let albumId = personalAlbum.id
                        
                        if isSelectMode {
                            SelectPhotoGridCellView(imageInstance: image, isSelected: false)
                        } else {
                            PhotoGridCellView(imageInstance: image, albumId: albumId)
                        }
                    }
                }
            }
            .simultaneousGesture(store.pinchGesture)
            .navigationTitle("Library")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                }
                ToolbarSpacer(placement: .topBarTrailing)
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
}

#Preview {
    PersonalAlbumView(personalAlbum: .constant(AlbumModel.personalAlbums))
        .environment(GridViewModel())
}
