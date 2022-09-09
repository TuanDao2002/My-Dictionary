//
//  SearchHistory.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI


struct SearchHistory: View {
//    let words = ["Hello", "Cunt", "Oi"]
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    @State var msg = ""
    @State var word: Word?
    
    var body: some View {
        VStack{
            ForEach(userVM.getUserSearchedWords(), id: \.self) { searchedWord in
                Button(action: {
                    wordVM.getWordDefinition(searchedWord: searchedWord) { msg, word in
                        self.msg = msg
                        self.word = word
                    }
                }, label: {
                    WordRow(title: searchedWord, userVM: userVM)
                })
            }
        }.onChange(of: msg, perform: { newValue in
            if msg == "Word found"{
                viewRouting.state = .wordView
                viewRouting.prevState = .historyView
            }
        })
    }
}

struct SearchHistory_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistory()
            .environmentObject(UserViewModel.obj)
            .environmentObject(ViewRouting())
    }
}
