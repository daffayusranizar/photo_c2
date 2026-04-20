import Foundation

struct ParticipantModel: Identifiable {
    let id = UUID()
    let username: String
    var name: String
    var profilePicture: String
}
