//
//  ProfileView.swift
//  ignew
//
//  Created by J C on 5/28/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
//     var posts: [Post] {
//        return Post.MOCK_POST.filter({ $0.user?.username == user.username })
    
    var body: some View {

            ScrollView{
                //header
                ProfileHeaderView(user: user)
                
                //postgrid
                
                PostGridView(user: user)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
       

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}