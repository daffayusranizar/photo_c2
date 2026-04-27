//
//  Photos_C2App.swift
//  Photos_C2
//
//  Created by Daffa Yuranizar Arrifi on 17/04/26.
//

import SwiftUI

@main
struct Photos_C2App: App {
    @State private var store = GridViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(personalAlbum: .constant(AlbumModel.personalAlbums))
                .environment(store)
        }
    }
}
