//
//  UserSettings.swift
//  My Dictionary
//
//  Created by Phi Thai on 05/09/2022.
//

import SwiftUI

struct UserSettings: View {
    
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
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
                ScrollView {
                    Text("\(userVM.getUser()?.username ?? "")")
                        .title()
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
                        .title()
                        .modifier(LeftAlign())
                    ForEach(userVM.getUserFavoriteWords(), id: \.self) { favWord in
//                        WordRow(title: favWord, userVM: userVM)
                        Button(action: {
                            viewRouting.state = .wordView
                            viewRouting.prevState = .userSetting
                        }, label: {
                            WordRow(title: favWord, userVM: userVM)
                        })
                    }
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
