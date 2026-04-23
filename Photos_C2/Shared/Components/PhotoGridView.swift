//
//  PhotoGridView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 21/04/26.
//

import SwiftUI

struct PhotoGridView: View {
    @Environment(GridViewModel.self) private var viewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns, spacing: 1) {
                ForEach(viewModel.images) { image in
                    PhotoGridCellView(imageInstance: image)
                }
            }
        }
    }
}

//#Preview {
//    PhotoGridView(images: <#T##[String]#>, columns: <#T##[GridItem]#>)
//}
