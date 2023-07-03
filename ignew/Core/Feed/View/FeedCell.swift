//
//  FeedCell.swift
//  ignew
//
//  Created by J C on 5/28/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            // user info
            HStack{
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xsmall)
                }
                
                
                if let username = post.user?.username{
                    Text(username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
               
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // post image
            KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(height: 400)
                        .clipShape(Rectangle())


            //action button
            HStack (spacing: 16) {
                Button{
                    print("Like Post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                    
                }
                Button{
                    print("Comment Post")
                } label: {
                    Image(systemName: "bubble.left")
                        .imageScale(.large)
                }
                Button{
                    print("Share Post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
             
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            
           
            
            //caption
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
              
            HStack{
                if let username = post.user?.username{
                    Text(username).fontWeight(.semibold) + Text(post.caption)
                }
               
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("3mins")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 2)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POST[0])
    }
}
