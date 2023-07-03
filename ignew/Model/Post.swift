//
//  Post.swift
//  ignew
//
//  Created by J C on 5/29/23.
//

import SwiftUI
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
}

extension Post {
    static var MOCK_POST: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Hot girl summer right around the corner",
            likes: 324123,
            imageUrl: "megp",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Found my light baby",
            likes: 1324123,
            imageUrl: "megp2",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Hot girl summer right around the corner",
            likes: 424123,
            imageUrl: "tinyp",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Hot girl summer right around the corner",
            likes: 624123,
            imageUrl: "kandp",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Hot girl summer right around the corner",
            likes: 24123,
            imageUrl: "tamekap",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Hot girl summer right around the corner",
            likes: 124123,
            imageUrl: "faithp",
            timestamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
    ]
}
