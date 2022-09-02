//
//  WordListHistory.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordListHistory: View {
    @Binding var user: User
//    let searchedWords = user.searchedWords
    var body: some View {
        VStack {
            ZStack {
                Color("Retro-Red").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack (alignment: .leading, spacing: 10){
                        Text("Search History")
                            .title()
                            .modifier(LeftAlign())
                        Spacer()
                            .frame(height: 60)
                        SearchHistory(searchedWords: $user.searchedWords)
                        Spacer()
                    }
                    .padding(30)
                }
            }
        }
    }
}

struct WordListHistory_Previews: PreviewProvider {
    static var previews: some View {
        WordListHistory(user: .constant(User(id: "1", username: "Phi", searchedWords: ["favorite", "content", "word"], favoriteWords: [])))
    }
}
