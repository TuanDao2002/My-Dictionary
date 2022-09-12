//
//  WordContentNavigation.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct WordContentNavigation: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    @State var word: Word?
    @State var todayWord = ""
    @State private var isLoading: Bool = false
    @State private var action: String = ""
    @State var msg = ""
    var body: some View {
        HStack(alignment: .center){
            Button (action: {
                wordVM.getWordDefinition(searchedWord: todayWord) { msg, word in
                    self.msg = msg
                    self.word = word
                }
                viewRouting.state = .mainView
            }, label: {
                Navigation()
                    .foregroundColor(.black)
            })
            
            Spacer()
            Button {
                Task {
                    if(!userVM.getUserFavoriteWords().contains(word?.word ?? "")){
                        isLoading = true
                        action = "Adding..."
                        //Change "Hello" with the word that need to add to favorite
                        wordVM.addFavoriteWord(userId: userVM.getUser()?.id ?? "", word: word?.word ?? "") { msg, status in
                            isLoading = false
                            action = ""
                        }
                    } else {
                        isLoading = true
                        action = "Removing..."
                        wordVM.removeFavoriteWord(userId: userVM.getUser()?.id ?? "", word: word?.word ?? "") { msg, status in
                            isLoading = false
                            action = ""
                        }
                    }
                }
            } label: {
                if (userVM.isLogin()) {
                    Image(systemName: userVM.getUserFavoriteWords().contains(word?.word ?? "") ? "star.fill" : "star")
                        .foregroundColor(Color("Hard-purple"))
                        .font(.system(.title2))
                        .overlay(labelOnTheLeft(check: isLoading, action: action))
                }
            }
        }.onAppear{
            wordVM.getTodayWord { word, statusCode in
                todayWord = word
            }
        }
    }
}

//struct WordContentNavigation_Previews: PreviewProvider {
//    static var previews: some View {
//        WordContentNavigation()
//    }
//}

func labelOnTheLeft(check: Bool, action: String) -> some View {
    GeometryReader { proxy in
        if(check) {
            Text(action)
                .subText()
                .fixedSize()
                .foregroundColor(Color("Hard-purple"))
                .padding(.trailing)
                .offset(x: -proxy.size.width + 10)
                .frame(width: proxy.size.width, alignment: .trailing)
        }
    }
}
