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
}

struct CountableItem: Decodable {
    let count: Int
}
