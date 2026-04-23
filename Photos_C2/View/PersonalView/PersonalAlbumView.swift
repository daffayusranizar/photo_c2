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

    var body: some View {
        NavigationStack {
            PhotoGridView()
            .simultaneousGesture(viewModel.pinchGesture)
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
                    Button("Select") { }
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
