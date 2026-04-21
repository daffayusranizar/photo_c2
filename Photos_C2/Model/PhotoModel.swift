import Foundation

struct PhotoModel: Identifiable {
    let id = UUID()
    var fileName: String
    var fileExtension: String
    var fileSizeInMB: Float
    var dateTime: Date
    var device: DeviceModel?
    var width: Int
    var height: Int
    var location: String?
    var isFavorite: Bool
}

struct DeviceModel: Identifiable {
    let id = UUID()
    var name: String?
    var cameraType:  String?
    var lensSize: Float?
    var focus: Float?
    var cameraPixel: Int?
    var iso: Int?
    var ev: Float?
    var shutterSpeed: Float?

}
