//
//  TopWord.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordRow: View {
    var title: String
    var isFavorite: Bool
    var userVM: UserViewModel
    var msg: String
    init(title: String, userVM: UserViewModel, msg: String) {
        self.title = title
        self.userVM = userVM
        self.msg = msg
        if (!userVM.isLogin()) {
            isFavorite = false
        } else if (!userVM.getUserFavoriteWords()
            .contains(where: {$0.caseInsensitiveCompare(title) == .orderedSame})) {
            isFavorite = false
        } else {
            isFavorite = true
        }
    }
    
    var body: some View {
        HStack{
            Image(systemName: isFavorite ? "star.fill" : "star")
                .foregroundColor(Color("Retro-Blue"))
                .font(.system(.title2))
                .opacity(userVM.isLogin() ? 1 : 0)
            Text(title.firstCapitalized)
                .subText()
                .foregroundColor(.black)
                .padding(.leading, 10)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(Color("Dark-Green"))
        }
        .padding()
        .frame(maxHeight: 65)
        .background(Color("Retro-Gray"))
        .cornerRadius(10)
    }
}

struct TopWord_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            WordRow(title: "Student", userVM: UserViewModel.obj, msg: "").background(.white)
        }.background(Color("Retro-Red"))
        
    }
}

struct WordRow_Button: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
    var title: String
    
    @Binding var isLoading: Bool
    @Binding var msg: String
    
    var body: some View {
        Button(action: {
            isLoading = true
            wordVM.getWordDefinition(searchedWord: title) { msg, word in
                self.msg = msg
                isLoading = false
            }
        }, label: {
            WordRow(title: title, userVM: userVM, msg: msg)
        })
        .frame(height: 60)
    }
}
