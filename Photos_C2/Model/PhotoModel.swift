import Foundation

struct PhotoModel: Identifiable, Equatable, Sendable {
    let id = UUID()
    var fileName: String
    var fileExtension: String
    var fileSizeInMB: Float
    var dateTime: Date
    var device: DeviceModel?
    var width: Int
    var height: Int
    var location: String?
    var isReviewed: Bool
    
    static var personalPhotos: [PhotoModel] = [
        PhotoModel(fileName: "dummy_photo_1", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_2", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: true),
            PhotoModel(fileName: "dummy_photo_3", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_4", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_5", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_6", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_7", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_8", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_9", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_10", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_11", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_12", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_13", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_14", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_15", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_16", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_17", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_18", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_19", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_20", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_21", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_22", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_23", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_24", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_25", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_26", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_27", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_28", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_29", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_30", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_31", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_32", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_33", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_34", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_35", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_36", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_37", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_38", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_39", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_40", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_41", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_42", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_43", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_44", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_45", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_46", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_47", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_48", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_49", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_50", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_51", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_52", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_53", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_54", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_55", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_56", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_57", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_58", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_59", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false),
            PhotoModel(fileName: "dummy_photo_60", fileExtension: "jpeg", fileSizeInMB: 3.3, dateTime: .now, width: 2340, height: 1580, isReviewed: false)
    ]
}

struct DeviceModel: Identifiable, Equatable, Sendable {
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
