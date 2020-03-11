//
//  FeedResponse.swift
//  MyFeedNews
//
//  Created by Alexander on 08.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    var response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
    var profiles: [Profile]
    var groups: [Group]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
    let attachments: [Attachment]?
}

struct Attachment: Decodable {
    let photo: Photo?
    let audio: Audio?
//    let video: Video?
//    let link: Link?
//    let poll: Poll?
//    let album: Album?
//    let sticker: Sticker?????
}

struct Audio: Decodable {
    let id: Int
    let ownerId: Int
    let artist: String
    let title: String
    let duration: Int
    let url: String
//    let lyricsId: Int
//    let albumId: Int?
//    let genreId: Int?
//    let date: Int
//    let noSearch: Int
//    let isHq: Int
}

struct Photo: Decodable {
    let sizes: [PhotoSize]
    
    var height: Int {
        return getPropperSize().height
    }
    
    var width: Int {
        return getPropperSize().width
    }
    
    var src: String {
        return getPropperSize().url
    }
    
    private func getPropperSize() -> PhotoSize {
        if let sizeX = sizes.first(where: { $0.type == "x" }) {
            return sizeX
        } else if let fallBackSize = sizes.last {
            return fallBackSize
        } else {
            return PhotoSize(type: "error", url: "error", width: 0, height: 0)
        }
    }
}

struct PhotoSize: Decodable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}

struct CountableItem: Decodable {
    let count: Int
}

protocol ProfileRepresentable {
    var id: Int { get }
    var name: String { get }
    var photo: String { get }
}

struct Profile: Decodable, ProfileRepresentable {

    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    var name: String { return firstName + " " + lastName }
    var photo: String { return photo100 }
}

struct Group: Decodable, ProfileRepresentable {
    let id: Int
    let name: String
    let photo100: String
    
    var photo: String { return photo100 }
}

