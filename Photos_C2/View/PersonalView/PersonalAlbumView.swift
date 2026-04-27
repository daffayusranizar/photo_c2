//
//  PersonalAlbumView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 20/04/26.
//

import SwiftUI

struct PersonalAlbumView: View {
    @Environment(GridViewModel.self) private var store  // ← only one, from environment

    @State private var isSelectMode = false

    var personalAlbum: AlbumModel? {
        store.getAlbum(byName: "Personal")  // ← computed property
    }

    var body: some View {
        if let personalAlbum = personalAlbum {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: store.columns, spacing: 1) {  // ← use store.columns
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
                .simultaneousGesture(store.pinchGesture)  // ← use store.pinchGesture
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
}

#Preview {
    PersonalAlbumView()
        .environment(GridViewModel())
}
