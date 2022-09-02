//
//  WordListHistory.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordListHistory: View {
    @Binding var user: User
    
    var body: some View {
        ZStack {
            Color("Retro-Red").edgesIgnoringSafeArea(.all)
            VStack {
                Navigation()
                    .padding(.top, 30)
                    .modifier(LeftAlign())
                ScrollView{
                    VStack (alignment: .leading){
                        Text("Search History")
                            .title()
                            .modifier(LeftAlign())
                        Spacer()
                            .frame(height: 60)
                        SearchHistory(searchedWords: $user.searchedWords)
                        Spacer()
                    }
                }
                .padding(.top, 10)
            }
            .modifier(Padding())
        }
    }
}

struct WordListHistory_Previews: PreviewProvider {
    static var previews: some View {
        WordListHistory(user: .constant(User(id: "1", username: "Phi", searchedWords: ["favorite", "content", "word"], favoriteWords: [])))
    }
}
