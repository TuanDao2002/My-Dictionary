//
//  WordListHistory.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordListHistory: View {
    @State var user: User
    
    var body: some View {
        let searchedWords = user.searchedWords

        VStack {
            ZStack {
                Color("Retro-Yellow").edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .leading, spacing: 0){
                    Text("Search History")
                        .headline()
                        .modifier(LeftAlign())
                        .foregroundColor(Color("Soft-purple"))
                        .padding(.leading, 40)
                        .padding(.vertical, 20)
                    
                    ForEach(searchedWords, id: \.self) { word in
                        Button(action: {
                            WordContentView(word: Word(title: word))
                        }, label: {
                            TopWord(word: Word(title: word))
                        })
                    }
                    Spacer()
                }
                .padding(.top, 20)
            }
        }
    }
}

struct WordListHistory_Previews: PreviewProvider {
    static var previews: some View {
        WordListHistory(user: User(id: "1", username: "Phi", searchedWords: ["favorite", "content", "word"], favoriteWords: []))
    }
}
