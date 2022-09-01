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
    var body: some View {
        VStack {
            Button("Register"){
                Task {
                    userVM.register(username: "tuan", password: "09092002") { msg, status in
                        self.msg = msg
                        self.status = status
                    }
                }
            }
            if (!msg.isEmpty) {
                Text("Message: \(msg)")
            }
            
            if (status != -1) {
                Text("Status: \(status)")
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
            .environmentObject(UserViewModel())
    }
}
