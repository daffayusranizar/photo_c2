////
////  SampleData.swift
////  Photos_C2
////
////  Created by Daffa Yuranizar Arrifi on 22/04/26.
////
//
//import Foundation
//
//
//struct SampleData {
//
//    static let participants: [ParticipantModel] = [
//        ParticipantModel(username: "daffa.arrifi",  name: "Daffa Yusranizar",  profilePicture: "dummy_photo_1"),
//        ParticipantModel(username: "ayu.dewi",      name: "Ayu Dewi",          profilePicture: "dummy_photo_2"),
//        ParticipantModel(username: "rizky.pratama", name: "Rizky Pratama",     profilePicture: "dummy_photo_3"),
//        ParticipantModel(username: "sari.indah",    name: "Sari Indah",        profilePicture: "dummy_photo_4"),
//        ParticipantModel(username: "budi.santoso",  name: "Budi Santoso",      profilePicture: "dummy_photo_5")
//    ]
//    
//    static let albums: [AlbumModel] = [
//        AlbumModel(
//            albumName: "Apple Developer Academy",
//            albumPhoto: "album_1",
//            participants: [participants[0], participants[1], participants[2]]
//        ),
//        AlbumModel(
//            albumName: "Academy Eats!",
//            albumPhoto: "album_2",
//            participants: [participants[0], participants[3]]
//        ),
//        AlbumModel(
//            albumName: "Academy Bali Trips",
//            albumPhoto: "album_3",
//            participants: [participants[1], participants[2], participants[4]]
//        ),
//    ]
//
//    // MARK: - Photos
//    static let photos: [PhotoModel] = (1...40).map { i in
//        PhotoModel(
//            fileName: "dummy_photo_\(i)",
//            fileExtension: "jpg",
//            fileSizeInMB: Float.random(in: 1.5...8.0).rounded(toPlaces: 2),
//            dateTime: randomDate(daysBack: i * 3),
//            width: [3024, 4032, 4480][i % 3],
//            height: [4032, 3024, 6720][i % 3],
//            location: locations[i % locations.count],
//            isFavorite: i % 7 == 0  // every 7th photo is favorited
//        )
//    }
//
//    // MARK: - Entries (Many-to-Many)
//    // Photos 1–15  → Album 0 (Apple Developer Academy)
//    // Photos 10–25 → Album 1 (Academy Eats!) — overlaps intentionally
//    // Photos 20–40 → Album 2 (Academy Bali Trips) — overlaps intentionally
//    static let entries: [PhotoAlbumEntry] = {
//        var result: [PhotoAlbumEntry] = []
//
//        let ranges: [(ClosedRange<Int>, Int)] = [
//            (1...15,  0),   // Academy
//            (10...25, 1),   // Eats
//            (20...40, 2),   // Bali Trips
//        ]
//
//        for (range, albumIndex) in ranges {
//            let album = albums[albumIndex]
//            for i in range {
//                let photo = photos[i - 1]  // array is 0-indexed
//                result.append(PhotoAlbumEntry(photoID: photo.id, albumID: album.id))
//            }
//        }
//
//        return result
//    }()
//
//    // MARK: - Helpers
//
//    private static let locations: [String?] = [
//        "Ubud, Bali",
//        "Seminyak, Bali",
//        "Canggu, Bali",
//        "Denpasar, Bali",
//        "Kuta, Bali",
//        nil,  // some photos have no location
//        nil,
//    ]
//
//    private static func randomDate(daysBack: Int) -> Date {
//        Calendar.current.date(byAdding: .day, value: -daysBack, to: Date()) ?? Date()
//    }
//}
//
//// MARK: - Float helper
//extension Float {
//    func rounded(toPlaces places: Int) -> Float {
//        let divisor = pow(10.0, Float(places))
//        return (self * divisor).rounded() / divisor
//    }
//}
