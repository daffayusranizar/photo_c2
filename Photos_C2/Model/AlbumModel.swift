import Foundation

struct AlbumModel: Identifiable {
    let id = UUID()
    var albumName: String
    var photos: [PhotoModel]
    var participants: [ParticipantModel]
}
