//
//  RegistrationView.swift
//  My Dictionary
//
//  Created by Phi Thai on 31/08/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var name = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("Hard-purple")
                    .ignoresSafeArea()
                VStack {
                    Text("User Registration")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                        .frame(height: 100)
                    
                    //Username
                    Header(header: "Username", textFieldName: "Enter your username", name: $name)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    //Password
                    Header(header: "Password", textFieldName: "Enter your password", name: $name)
                    
                    Text("New user? Register here")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top)
                    Spacer()
                        .frame(height: 50)
                    
                    Button() {
                        
                    } label: {
                        Text("Register")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(Color("Hard-purple"))
                    }
                    .background(Color("Purple"))
                    .cornerRadius(15)
                    Spacer()
                    
                }
                .padding(30)
            }
        }
    }
}

struct Header: View {
    var header: String
    var textFieldName: String
    @Binding var name: String
    
    var body: some View {
        Text("\(header):")
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .modifier(TextModifier())
                .padding(.leading)
            TextField("\(textFieldName)", text: $name)
                .frame(width: .infinity, height: 15)
                .modifier(TextFieldModifier())
    }
}
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
