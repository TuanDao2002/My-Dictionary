//
//  SearchBlock.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var userVM: UserViewModel
    
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
                Button("Log in/ Register"){}
            }
            
        }
        .foregroundColor(.white)
    }
}

struct SearchBlock_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Header(name: .constant("Phi cunt"))
        }
        .background(Color("Hard-purple"))
    }
}
