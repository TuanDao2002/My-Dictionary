//
//  Test.swift
//  My Dictionary
//
//  Created by Tuan Dao on 01/09/2022.
//

import SwiftUI

struct Test: View {
    @EnvironmentObject var userVM: UserViewModel
    @State private var msg: String = ""
    @State private var status: Int = -1
    @State private var user: User?
    
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
            TextField("Password", text: $password)

            Button("Register"){
                Task {
                    userVM.register(username: username, password: password) { msg, status in
                        self.msg = msg
                        self.status = status
                    }
                }
            }
                        
            Button("Login"){
                Task {
                    userVM.login(username: username, password: password) { msg, status, user in
                        self.msg = msg
                        self.status = status
                        
                        userVM.saveUser(user: user)
                        self.user = userVM.getUser()
                    }
                }
            }
            
            if (!msg.isEmpty) {
                Text("Message: \(msg)")
            }
            
            if (status != -1) {
                Text("Status: \(status)")
            }
            
            if (user != nil) {
                Text("UserId: \(user?.id ?? "undefined")")
                Text("UserId: \(user?.username ?? "undefined")")
            }
        }
        .onAppear() {
            self.user = userVM.getUser()
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
            .environmentObject(UserViewModel())
    }
}
