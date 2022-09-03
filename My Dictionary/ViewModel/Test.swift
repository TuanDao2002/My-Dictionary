//
//  Test.swift
//  My Dictionary
//
//  Created by Tuan Dao on 01/09/2022.
//

import SwiftUI

struct Test: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @State private var msg: String = ""
    @State private var status: Int = -1
    @State private var user: User?
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            TextField("Username", text: $username)
            TextField("Password", text: $password)

            Button("Register"){
                Task {
                    isLoading = true
                    userVM.register(username: username, password: password) { msg, status in
                        isLoading = false
                        self.msg = msg
                        self.status = status
                    }
                }
            }
                        
            Button("Login"){
                Task {
                    isLoading = true
                    userVM.login(username: username, password: password) { msg, status in
                        isLoading = false
                        self.msg = msg
                        self.status = status
                        self.user = userVM.user
                    }
                }
            }
            
            Button("Logout") {
                isLoading = true
                userVM.logout()
                self.msg = "You have logged out"
                self.status = -1
                self.user = userVM.user
                isLoading = false
            }
            
            VStack {
                Button("add searched word") {
                    Task {
                        isLoading = true
                        wordVM.addSearchedWord(userId: user?.id ?? "", word: "seven") { msg, status in
                            isLoading = false
                            self.msg = msg
                            self.status = status
                            self.user = userVM.user
                        }
                    }
                }
                
                Button("add favorite word") {
                    Task {
                        isLoading = true
                        wordVM.addFavoriteWord(userId: user?.id ?? "", word: "one") { msg, status in
                            isLoading = false
                            self.msg = msg
                            self.status = status
                            self.user = userVM.user
                        }
                    }
                }

                Button("get today word") {
                    Task {
                        isLoading = true
                        wordVM.getTodayWord() { msg, status in
                            isLoading = false
                            self.msg = msg
                            self.status = status
                        }
                    }
                }
            }
            
            if (isLoading) {
                Text("Loading...")
            }
            
            if (!msg.isEmpty && !isLoading) {
                Text("Message: \(msg)")
            }
            
            if (status != -1 && !isLoading) {
                Text("Status: \(status)")
            }
            
            if (user != nil) {
                Text("UserId: \(user?.id ?? "undefined")")
                Text("UserId: \(user?.username ?? "undefined")")
                
                Text("Searched:")
                ForEach(userVM.getUserSearchedWords(), id: \.self) { searchedWord in
                    Text(searchedWord)
                }
                
                Text("Favorite:")
                ForEach(userVM.getUserFavoriteWords(), id: \.self) { favoriteWord in
                    Text(favoriteWord)
                }
            } else {
                Text("No user account")
            }
        }
        .onAppear() {
            self.user = userVM.user
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
            .environmentObject(UserViewModel.obj)
            .environmentObject(WordViewModel())
    }
}
