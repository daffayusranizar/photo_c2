//
//  PhotoGridCellView.swift
//  Photos_C2
//
//  Created by Steve Agustinus Arrifi on 23/04/26.
//

import SwiftUI

struct SelectPhotoGridCellView: View {
    let imageInstance: PhotoModel
    @State var isSelected = false

    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            ZStack(alignment: .topTrailing) {
                Image(imageInstance.fileName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity,
                           minHeight: 0, maxHeight: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .contentShape(Rectangle())
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.black.opacity(0.3))
                
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 22))
                    .foregroundColor(isSelected ? .blue : .white.opacity(0.7))
                    .background(Circle().fill(isSelected ? .white : .clear))
                    .padding(8)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .buttonStyle(.plain)
    }
}
