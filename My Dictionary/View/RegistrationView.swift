//
//  RegistrationView.swift
//  My Dictionary
//
//  Created by Phi Thai on 31/08/2022.
//
// Note to change view to both register and log in session view
// so add one more button to the view

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    
    // Global variable to change view of app
    @EnvironmentObject var viewRouting: ViewRouting
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var msg: String = ""
    @State private var status: Int = -1
    @State private var user: User?

    
    @State private var isLoading: Bool = false
    var body: some View {
        ZStack{
            // Background color
            Color("Retro-Brown")
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    viewRouting.state = .mainView
                }, label: {
                    Navigation()
                        .padding(.top, 30)
                        .modifier(LeftAlign())
                        .foregroundColor(Color("Retro-Gray"))
                })
                
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
                }.background(Color("Retro-Yellow"))
                    .cornerRadius(15)
                    
                Spacer()
                
                // Login button
//                Button(action: {
//                    
//                }, label: {
//                    Text("Log in")
//                        .buttonText()
//                })
//                .background(Color("Retro-Yellow"))
//                .cornerRadius(15)

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
            .environmentObject(ViewRouting())
            .previewDevice("iPhone 11")
    }
}
