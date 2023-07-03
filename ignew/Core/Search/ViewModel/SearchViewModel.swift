//
//  SearchViewModel.swift
//  ignew
//
//  Created by J C on 5/29/23.
//

import Foundation


class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws{
        self.users = try await UserService().fetchAllUsers()
    }
}
