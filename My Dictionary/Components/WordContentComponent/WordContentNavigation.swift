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
    let word: Word?
    
    @State private var isLoading: Bool = false
    
    var body: some View {
        HStack(alignment: .center){
            Button (action: {
                viewRouting.state = viewRouting.prevState
            }, label: {
                Navigation()
                    .foregroundColor(.black)
            })
            
            Spacer()
            Button {
                Task {
                    if(!userVM.getUserFavoriteWords().contains(word?.word ?? "")){
                        isLoading = true
                        //Change "Hello" with the word that need to add to favorite
                        wordVM.addFavoriteWord(userId: userVM.getUser()?.id ?? "", word: word?.word ?? "") { msg, status in
                            isLoading = false
                        }
                    } else {
                        print("Có rồi")
                    }
                }
            } label: {
                if (userVM.isLogin()) {
                    Image(systemName: userVM.getUserFavoriteWords().contains(word?.word ?? "") ? "star.fill" : "star")
                        .foregroundColor(Color("Hard-purple"))
                        .font(.system(.title2))
                        .overlay(labelOnTheLeft(check: isLoading))
                }
            }
        }
    }
}

//struct WordContentNavigation_Previews: PreviewProvider {
//    static var previews: some View {
//        WordContentNavigation()
//    }
//}

func labelOnTheLeft(check: Bool) -> some View {
    GeometryReader { proxy in
        if(check) {
            Text("Adding...")
                .subText()
                .fixedSize()
                .foregroundColor(Color("Hard-purple"))
                .padding(.trailing)
                .offset(x: -proxy.size.width + 10)
                .frame(width: proxy.size.width, alignment: .trailing)
        }
    }
}
