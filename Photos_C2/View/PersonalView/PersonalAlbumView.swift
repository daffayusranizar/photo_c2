//
//  PersonalAlbumView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 20/04/26.
//

import SwiftUI

@MainActor
struct PersonalAlbumView: View {
    @State private var viewModel = GridViewModel()
    @State private var isSelectMode = false

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns, spacing: 1) {
                    ForEach(viewModel.images) { image in
                        if isSelectMode {
                            SelectPhotoGridCellView(imageInstance: image, isSelected: false)
                        } else {
                            PhotoGridCellView(imageInstance: image)
                        }
                    }
                }
            }
            .simultaneousGesture(viewModel.pinchGesture)
            .navigationTitle("Library")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
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
        .environment(viewModel)
    }
}



#Preview {
    PersonalAlbumView()
}
