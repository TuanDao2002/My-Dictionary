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
                Color("Retro-Brown")
                    .ignoresSafeArea()
                VStack {
                    Text("User Registration")
                        .title()
                        .modifier(LeftAlign())
                    Spacer()
                        .frame(height: 60)
                    
                    //Username
                    InputField(header: "Username", textFieldName: "", name: $name)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    //Password
                    InputField(header: "Password", textFieldName: "", name: $name)
                    
                    Text("New user? Register here")
                        .modifier(RightAlign())
                        .font(.callout)
                        .foregroundColor(Color("Retro-Gray"))
                        .padding(.top, 5)
                    Spacer()
                        .frame(height: 50)
                    
                    Button() {
                        
                    } label: {
                        Text("Register")
                            .buttonText()
                            
                    }
                    .background(Color("Retro-Yellow"))
                    .cornerRadius(15)
                    Spacer()
                    
                }
                .padding(30)
            }
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
    }
}
