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
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack{
            ForEach(userVM.getUserSearchedWords(), id: \.self) { searchedWord in
                WordRow_Button(title: searchedWord, isLoading: $isLoading, msg: $msg)
            }
        }.onChange(of: msg, perform: { newValue in
            if msg == "Word found"{
                viewRouting.state = .wordView
                viewRouting.prevState = .historyView
            }
        })
    }
}
