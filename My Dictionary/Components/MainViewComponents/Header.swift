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
 
    var body: some View {
        VStack(spacing: 10){
            if userVM.isLogin() {
                Text("Welcome!")
                    .title()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                //Handle optional here >>
                Text(userVM.getUser()?.username ?? "Unvalid name")
                    .title()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
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
