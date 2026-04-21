//
//  PersonalAlbumView.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 20/04/26.
//

import SwiftUI

@MainActor
struct PersonalAlbumView: View {
    let images = (1...100).map { "dummy_photo_\($0)" }

    @State private var columnCount: Double = 3
    @State private var lastColumnCount: Double = 3
    @State private var isPinching = false
    var columns: [GridItem] {
        Array(
            repeating: GridItem(.flexible(), spacing: 1),
            count: Int(round(columnCount))
        )
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
            }
            .simultaneousGesture(pinchGesture)
            .navigationTitle("Library")
            .toolbarTitleDisplayMode(.inlineLarge)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Select") { }
                        .fontWeight(.semibold)
                }
            }
        }
    }


    private var pinchGesture: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                if !isPinching {
                    isPinching = true
                    lastColumnCount = round(columnCount)
                }
                let delta = (value - 1) * 4
                let newCount = (lastColumnCount - delta).clamped(to: 3...15)
                withAnimation(.interactiveSpring()) {
                    columnCount = newCount
                }
            }
            .onEnded { _ in
                isPinching = false
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    columnCount = round(columnCount)
                    lastColumnCount = columnCount
                }
            }
    }
}

private extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        min(max(self, range.lowerBound), range.upperBound)
    }
}

#Preview {
    PersonalAlbumView()
}
