/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Bui Quang An
  ID: s3877482
  Created date: 31/08/2022
  Last modified: 16/09/2002
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI


struct SearchHistory: View {
    // Global object to change view of app
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
    @State var msg = ""
    @Binding var isLoading: Bool
    
    var body: some View {
        VStack{
//          Display list of words user has searched recently
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
