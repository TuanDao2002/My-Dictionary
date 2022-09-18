/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Bui Quang An
  ID: s3877482
  Created date: 31/08/2022
  Last modified: 16/09/2002
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct Header: View {
    // Global object to change view of app
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var viewRouting: ViewRouting
 
    var body: some View {
//      Display username if user has logged in. Otherwise, it will display Login Register button
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
                    Text("Register or Log in")
                        .underline()
                        .title()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "chevron.right")
                })
            }
            
        }
        
        .foregroundColor(.white)
    }
}
