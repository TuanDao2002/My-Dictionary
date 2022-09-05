//
//  SearchBlock.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
    @Binding var name: String
 
    var body: some View {
        VStack(spacing: 10){
            if userVM.isLogin() {
                Text("Welcome back")
                    .title()
                
                //Handle optional here >>
                Text(userVM.user!.username)
                    .title()
            } else {
                Button (action: {
                    viewRouting.state = .registrationView
                }, label: {
                    Text("Register/Log in")
                })
            }
            
        }
        .foregroundColor(.white)
    }
}

struct SearchBlock_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Header(name: .constant("Phi cunt"))
                .environmentObject(ViewRouting())
        }
        .background(Color("Hard-purple"))
    }
}
