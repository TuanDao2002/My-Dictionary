/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Thai Manh Phi
  ID: s3878070
  Created date: 02/09/2022
  Last modified: 18/09/2002
  Acknowledgement:
 1. https://www.simpleswiftguide.com/how-to-add-text-overlay-on-image-in-swiftui/
*/

import SwiftUI

//View for the navigation of word content view
//This view will contain the return button as well as the add or remove favorite
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
            
            //Return button
            Button (action: {
                viewRouting.state = viewRouting.prevState
            }, label: {
                Navigation()
            })
            
            Spacer()
            
            //Add or remove to favorite
            Button {
                Task {
                    if(!userVM.getUserFavoriteWords().contains(word?.word ?? "")){
                        isLoading = true
                        action = "Adding..."
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
                        .padding(.top, 40)
                        .foregroundColor(Color("Retro-Brown"))
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

//Overide the view for the message to be appear on the left side
func labelOnTheLeft(check: Bool, action: String) -> some View {
    GeometryReader { proxy in
        if(check) {
            Text(action)
                .subText()
                .fixedSize()
                .padding(.top, 45)
                .foregroundColor(Color("Retro-Brown"))
                .padding(.trailing)
                .offset(x: -proxy.size.width + 10)
                .frame(width: proxy.size.width, alignment: .trailing)
        }
    }
}
