//
//  User.swift
//  ignew
//
//  Created by J C on 5/28/23.
//

import Foundation
import Firebase


struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool  {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false}
        
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "Tinasnow", profileImageUrl: nil, fullname: "tina snow", bio: "The Stallion", email: "tinasnow@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Tiny", profileImageUrl: nil, fullname: "tiny harris", bio: "The Champ", email: "tiny@gmail.com"),
        .init(id: NSUUID().uuidString, username: "Kandi", profileImageUrl: nil, fullname: "kandi burrus", bio: "The bag is always secured", email: "kandi@gmail.com"),
        .init(id: NSUUID().uuidString, username: "tameka", profileImageUrl: nil, fullname: "tameka scott", bio: "My Sister Robbed me", email: "tameka@gmail.com"),
        .init(id: NSUUID().uuidString, username: "faith", profileImageUrl: nil, fullname: "faith evens", bio: "I dont love stevie", email: "faith@gmail.com"),
    ]
}
