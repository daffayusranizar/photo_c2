//
//  PhotoGridCellView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 21/04/26.
//

import SwiftUI

struct PhotoGridCellView: View {
    let imageInstance: PhotoModel

    var body: some View {
        NavigationLink(
            destination: PhotoDetailView(
                imageInstance: imageInstance
            )) {
                Image(imageInstance.fileName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity,
                       minHeight: 0, maxHeight: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .contentShape(Rectangle())
        }
    }
}
//#Preview {
//    PhotoGridCellView()
//}
