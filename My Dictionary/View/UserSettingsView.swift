//
//  UserSettings.swift
//  My Dictionary
//
//  Created by Phi Thai on 05/09/2022.
//

import SwiftUI

struct UserSettings: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    @State var msg = ""
    @State var word: Word?
    
    var body: some View {
        ZStack {
            Color("Retro-Yellow")
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    viewRouting.state = .mainView
                }, label: {
                    Navigation()
                        .padding(.top, 30)
                        .modifier(LeftAlign())
                        .foregroundColor(.black)
                })
                ScrollView(showsIndicators: false) {
                    Text("\(userVM.getUser()?.username ?? "")")
                        .darkTitle()
                        .modifier(LeftAlign())
                    Spacer()
                        .frame(height: 25)
                    Button() {
                        Task {
                            userVM.logout()
                            viewRouting.state = .mainView
                        }
                    } label: {
                        Text("Logout")
                            .buttonText()
                            .frame(maxWidth: .infinity)
                    }.background(Color("Retro-Red"))
                    .cornerRadius(15)
                    Spacer()
                        .frame(height: 25)
                    Text("Favorite words")
                        .darkTitle()
                        .modifier(LeftAlign())
                    ForEach(userVM.getUserFavoriteWords(), id: \.self) { favWord in
//                        WordRow(title: favWord, userVM: userVM)
                        Button(action: {
                            wordVM.getWordDefinition(searchedWord: favWord) { msg, word in
                                self.msg = msg
                                self.word = word
                            }
                        }, label: {
                            WordRow(title: favWord, userVM: userVM, msg: msg)
                        }).frame(height: 60)
                    }.onChange(of: msg, perform: { newValue in
                        if msg == "Word found"{
                            viewRouting.state = .wordView
                            viewRouting.prevState = .userSetting
                        }
                    })
                }
            }
            .modifier(Padding())
        }
    }
}

struct UserSettings_Previews: PreviewProvider {
    static var previews: some View {
        UserSettings()
            .environmentObject(UserViewModel.obj)
    }
}
