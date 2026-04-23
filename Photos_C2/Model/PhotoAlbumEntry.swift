//
//  PhotoAlbumEntry.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 22/04/26.
//

import Foundation

struct PhotoAlbumEntry: Identifiable {
    let id = UUID()
    let photoID: UUID
    let albumID: UUID
}
