//
//  MainViewButton.swift
//  My Dictionary
//
//  Created by Phi Thai on 13/09/2022.
//

import SwiftUI

struct TodayWordButton: View {
    @EnvironmentObject var viewRouting: ViewRouting
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    
    @Binding var searchBarTouched: Bool
    var todayWord: String
    @Binding var isLoading: Bool
    @Binding var msg: String
    @Binding var searchedClicked: Bool
    @Binding var word: Word?
    var width: Double
    
    @FocusState private var searchFieldFocus: TextFieldFocus?
    var body: some View {
        Button(action: {
            isLoading = true
            // Set the previous view is main view
            viewRouting.prevState = .mainView
            wordVM.getWordDefinition(searchedWord: todayWord) { msg, word in
                self.msg = msg
                self.word = word
                isLoading = false
            }
        }, label: {
            //                    WordRow(title: isLoading ? "Loading..." : todayWord, userVM: userVM, msg: msg)
            if(!isLoading){
                Text("TODAY WORD")
                    .customFont(size: 20)
                    .padding()
            } else {
                Text("Loading...")
                    .customFont(size: 20)
                    .padding()
            }
            Spacer()
            Image(systemName: "arrow.right")
                .padding()
            
        })
        .foregroundColor(Color("Retro-Yellow"))
        .frame(width: width - 60)
        .overlay(RoundedRectangle(cornerRadius: 50)
            .stroke(Color("Retro-Yellow"), lineWidth: 2))
        .modifier(Hide(check: searchBarTouched))
    }
}

struct ProfileButton: View {
    @EnvironmentObject var viewRouting: ViewRouting
    @EnvironmentObject var userVM: UserViewModel
    
    var searchBarTouched: Bool
    
    var body: some View {
        Button {
            viewRouting.state = .userSetting
        } label: {
            HStack{
                Text("PROFILE")
                    .customFont(size: 20)
                    .padding(.leading, 10)
                Image(systemName: "chevron.right")
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .overlay(RoundedRectangle(cornerRadius: 50)
                .stroke(.black, lineWidth: 2))
        }
        .padding(.top, 40)
        .modifier(RightAlign())
        .modifier(Hide(check: searchBarTouched))
        .modifier(Hide(check: !userVM.isLogin()))
        .foregroundColor(Color("Retro-Gray"))
    }
}
