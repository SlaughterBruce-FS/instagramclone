//
//  LoginView.swift
//  ignew
//
//  Created by J C on 5/28/23.
//

import SwiftUI

struct LoginView: View {
 
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            
            VStack{
                
                Spacer()
                //logo image
                Image("blackig")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                //text
                VStack{
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(IGTextFieldModifer())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(IGTextFieldModifer())
                }
                
                Button{
                    print("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                       
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button{
                    Task { try await  viewModel.signIn() }
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                    
                }.padding(.vertical)
                
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
         
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
               
                }.foregroundColor(.gray)
                
                
                HStack{
                    Image("facebook-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Text("Continue with Facbook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Divider()
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack (spacing: 3) {
                        Text("Don't have an account?")
                            .font(.footnote)
                        
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }.padding(.vertical, 16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
