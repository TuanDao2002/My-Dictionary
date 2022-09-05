//
//  RegistrationView.swift
//  My Dictionary
//
//  Created by Phi Thai on 31/08/2022.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var msg: String = ""
    @State private var status: Int = -1
    @State private var user: User?

    
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack{
            Color("Retro-Brown")
                .ignoresSafeArea()
            VStack {
                Navigation()
                    .padding(.top, 30)
                    .modifier(LeftAlign())
                Text("User Registration")
                    .title()
                    .modifier(LeftAlign())
                Spacer()
                
                //Username
                InputField(header: "Username", textFieldName: "", name: $username)
                
                Spacer()
                    .frame(height: 30)
                
                //Password
                InputField(header: "Password", textFieldName: "", name: $password)
                
                Text("New user? Register here")
                    .modifier(RightAlign())
                    .font(.custom("SpaceGrotesk-Regular", size: 15))
                    .foregroundColor(Color("Retro-Gray"))
                    .padding(.top, 5)
                Spacer()
                    .frame(height: 50)
                
                Button() {
                    Task {
                        isLoading = true
                        userVM.register(username: username, password: password) { msg, status in
                            isLoading = false
                            self.msg = msg
                            self.status = status
                        }
                    }
                } label: {
                    Text("Register")
                        .buttonText()
                        
                }
                .background(Color("Retro-Yellow"))
                .cornerRadius(15)
                Spacer()
            }
            .modifier(Padding())
        }
    }
}

struct InputField: View {
    var header: String
    var textFieldName: String
    @Binding var name: String
    
    var body: some View {
        Text("\(header):")
            .textFieldHeader()
        TextField("\(textFieldName)", text: $name)
            .modifier(TextFieldModifier())
    }
}
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .previewDevice("iPhone 11")
    }
}
