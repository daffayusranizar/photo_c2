//
//  GridViewModel.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 20/04/26.
//

import SwiftUI

@Observable
final class GridViewModel {

    var columnCount: Double = 3

    private var lastColumnCount: Double = 3
    private var isPinching = false
    
    var albums: [AlbumModel] = AlbumModel.albums
    var personalAlbum: AlbumModel = AlbumModel.personalAlbums

    var columns: [GridItem] {
        Array(
            repeating: GridItem(.flexible(), spacing: 1),
            count: Int(round(columnCount))
        )
    }
    
    func addAlbum(_ album: AlbumModel) {
            albums.append(album)
        }
    
    func getAlbum(byName name: String) -> AlbumModel? {
        albums.first { $0.albumName == name }
    }

    var pinchGesture: some Gesture {
        MagnificationGesture()
            .onChanged { [self] value in
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
            .onEnded { [self] _ in
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
