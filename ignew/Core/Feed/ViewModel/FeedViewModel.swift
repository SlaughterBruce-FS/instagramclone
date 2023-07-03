//
//  FeedViewModel.swift
//  ignew
//
//  Created by J C on 5/30/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject{
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
        
//        for post in posts {
//            let ownerUid = post.ownerUid
//            let postUser = try await UserService.fetchUser(withUid: ownerUid)
//            post.user = postUser
//        }
    }
}
