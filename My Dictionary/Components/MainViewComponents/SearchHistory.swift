//
//  SearchHistory.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI


struct SearchHistory: View {
    let searchHistory = [
        Word(title: "Duong"),Word(title: "Phi"),Word(title: "An"),
    ]
    var body: some View {
//        VStack{
            ForEach(searchHistory){
                word in
                TopWord(word: word)
            }
//        }
    }
}

struct SearchHistory_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistory()
    }
}
