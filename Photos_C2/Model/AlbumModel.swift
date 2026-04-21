import Foundation

struct AlbumModel: Identifiable {
    let id = UUID()
    var albumName: String
    var albumPhoto: String
    var photos: [PhotoModel]
    var participants: [ParticipantModel]
    
    static var albums: [AlbumModel] = [
        AlbumModel(
            albumName: "Apple Developer Academy",
            albumPhoto: "album_1",
            photos: [
                PhotoModel(
                    fileName: "photo_1",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isFavorite: false
                )
            ],
            participants: []
        ),
        AlbumModel(
            albumName: "Academy Eats!",
            albumPhoto: "album_2",
            photos: [],
            participants: []
        ),
        AlbumModel(
            albumName: "Academy Bali Trips",
            albumPhoto: "album_3",
            photos: [],
            participants: []
        )
    ]
}
