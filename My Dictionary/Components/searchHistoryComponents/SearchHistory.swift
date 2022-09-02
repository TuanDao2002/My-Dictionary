//
//  SearchHistory.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI


struct SearchHistory: View {
    @Binding var searchedWords: [String]

    var body: some View {
//        VStack{
//            ForEach(searchHistory){
//                word in
//                TopWord(word: word)
//            }
//        }
        ForEach(searchedWords, id: \.self) { word in
            Button(action: {
                WordContentView()
            }, label: {
                WordRow(title: word)
            })
        }
    }
}

struct SearchHistory_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistory(searchedWords: .constant(["favorite", "content", "word"]))
    }
}
