//
//  EditProfileView.swift
//  ignew
//
//  Created by J C on 5/29/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
//    @State private var selectedImage: PhotosPickerItem?
    
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack{
            //toolbar
            VStack {
                HStack{
                    Button{
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button{
                        Task {try await viewModel.updateUserData() }
                        dismiss()
                    } label: {
                        Text("Done")
                            .fontWeight(.semibold)
                    }
                }.padding(.horizontal)
                
                Divider()
            }
            
            //edit profile pic
            
            PhotosPicker( selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage{
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                        .frame(width: 80, height: 80)
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .small)
                    }
                    
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
                
            }
            .padding(.vertical, 8)
            
            
            //edit profile info
            VStack{
                EditProfileRowView(title: "name", placeholder: "enter your name", text: $viewModel.fullname)
                
                
            }
            
            VStack{
                EditProfileRowView(title: "Bio", placeholder: "enter your bio", text: $viewModel.bio)
                
                
            }
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View{
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack{
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }.font(.subheadline)
            .frame(height: 36)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USERS[0])
    }
}
