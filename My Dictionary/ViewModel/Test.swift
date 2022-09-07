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
    @State private var word: Word?
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var searchedWord: String = ""
    
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
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
                            self.user = userVM.getUser()
                        }
                    }
                }
                
                Button("Logout") {
                    isLoading = true
                    userVM.logout()
                    self.msg = "You have logged out"
                    self.status = -1
                    self.user = userVM.getUser()
                    isLoading = false
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
            
            VStack {
                TextField("Word to search", text: $searchedWord)
                Button("search word") {
                    Task {
                        isLoading = true
                        wordVM.getWordDefinition(searchedWord: searchedWord) { msg, word in
                            self.msg = msg
                            self.word = word
                            isLoading = false
                        }
                    }
                }
                
                Button("add favorite word") {
                    Task {
                        isLoading = true
                        //Change "Hello" with the word that need to add to favorite
                        wordVM.addFavoriteWord(userId: user?.id ?? "", word: "hello") { msg, status in
                            isLoading = false
                            self.msg = msg
                            self.status = status
                            self.user = userVM.getUser()
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
                
                if (word != nil) {
                    Text("Word: \(word?.word ?? "")")
                    if (word?.text != "") {
                        Text("Phonetic: \(word?.text ?? "")")
                    }
                    
                    if (word?.audio != "") {
                        Text("Audio: \(word?.audio ?? "")")
                    }
                    
                    Text("Synonyms:")
                    ForEach(word?.synonyms ?? [], id: \.self) { synonym in
                        Text(synonym)
                    }
                    
                    Text("Antonyms:")
                    ForEach(word?.antonyms ?? [], id: \.self) { antonym in
                        Text(antonym)
                    }
                    
                    Text("Meanings:")
                    ForEach(word?.meanings ?? [], id: \.self) { meaning in
                        Text("Part of speech: \(meaning.partOfSpeech)")
                        Text("Definitions:")
                        ForEach(meaning.definitions, id: \.self) { definition in
                            Text("Definition: \(definition.definition)")
                            if (definition.example != "") {
                                Text("Example: \(definition.example)")
                            }
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
        }
        .onAppear() {
            self.user = userVM.getUser()
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
