//
//  CurrentUserProfileView.swift
//  ignew
//
//  Created by J C on 5/29/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    

    var body: some View {
                NavigationStack {
                    ScrollView{
                        //header
                        ProfileHeaderView(user: user)
                        
                        //postgrid
                        
                        PostGridView(user: user)
                        
                    }
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                AuthService.shared.signout()
                            }) {
                                Image(systemName: "line.3.horizontal")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
