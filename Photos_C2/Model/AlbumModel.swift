//
//  PhotoModel 2.swift
//  SharedPhotos
//
//  Created by Steve Agustinus on 20/04/26.
//


import Foundation

struct AlbumModel: Identifiable {
    let id = UUID()
    var albumName: String
    var albumPhoto: String
    var photos: [PhotoModel]
    var participants: [ParticipantModel]
    
    static var albums: [AlbumModel] = [
        AlbumModel(
            albumName: "Personal",
            albumPhoto: "album_1",
            photos: [
                PhotoModel(
                    fileName: "photo_1",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_2",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_3",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_4",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_1",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_2",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_3",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_4",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_1",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_2",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_3",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                ),
                PhotoModel(
                    fileName: "photo_4",
                    fileExtension: "heic",
                    fileSizeInMB: 2.3,
                    dateTime: .now,
                    width: 1920,
                    height: 1080,
                    isReviewed: false
                )
            ],
            participants: [
                ParticipantModel(username: "stvea", name: "You", profilePicture: "person_1"),
                ParticipantModel(username: "daffa123", name: "Daffa", profilePicture: "person_2"),
                ParticipantModel(username: "syafiq111", name: "Syafiq", profilePicture: "person_3"),
                ParticipantModel(username: "test", name: "Test", profilePicture: "person_4"),
            ]
        ),
        AlbumModel(
            albumName: "Apple Developer Academy",
            albumPhoto: "album_1",
            photos: [PhotoModel(
                fileName: "photo_1",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_2",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_3",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_4",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_1",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_2",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_3",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_4",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_1",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_2",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_3",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            ),
            PhotoModel(
                fileName: "photo_4",
                fileExtension: "heic",
                fileSizeInMB: 2.3,
                dateTime: .now,
                width: 1920,
                height: 1080,
                isReviewed: false
            )],
            participants: [
                ParticipantModel(username: "stvea", name: "You", profilePicture: "person_1"),
                ParticipantModel(username: "syafiq111", name: "Syafiq", profilePicture: "person_3"),
            ]
        ),
        AlbumModel(
            albumName: "Academy Eats!",
            albumPhoto: "album_2",
            photos: [],
            participants: [
                ParticipantModel(username: "stvea", name: "You", profilePicture: "person_1"),]
        ),
        AlbumModel(
            albumName: "Academy Bali Trips",
            albumPhoto: "album_3",
            photos: [],
            participants: [
                ParticipantModel(username: "stvea", name: "You", profilePicture: "person_1"),
                ParticipantModel(username: "syafiq111", name: "Syafiq", profilePicture: "person_3"),
            ]
        ),
    ]
}
