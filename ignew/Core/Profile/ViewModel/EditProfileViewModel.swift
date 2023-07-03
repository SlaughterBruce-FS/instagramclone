//
//  EditProfileViewModel.swift
//  ignew
//
//  Created by J C on 5/29/23.
//

import Firebase
import PhotosUI
import SwiftUI


@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User

    
    @Published var selectedImage: PhotosPickerItem? {
        didSet{ Task {await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var profileImage: Image?
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname{
            self.fullname = fullname
        }
        
        if let bio = user.bio{
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async{
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        //Update profile user if changed
        
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.UploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        //update user name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            user.fullname = fullname
            data["fullname"] = fullname
        }
        //update Bio if changed
        
        if !bio.isEmpty && user.bio != bio {
            user.bio = bio
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
}
