/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Dao Kha Tuan
  ID: s3877347
  Created date: 30/08/2022
  Last modified: 16/09/2002
  Acknowledgement: Acknowledge the resources that you use here.
*/


import SwiftUI

// View for users to see their account's information and favorite words that they have stored
struct UserSettings: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
    @State var msg = ""
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Color("Retro-Yellow")
                .ignoresSafeArea()
            VStack {
                Button(action: {
                    viewRouting.state = .mainView
                }, label: {
                    Navigation()
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
                        WordRow_Button(title: favWord, isLoading: $isLoading, msg: $msg)
                    }
                    .onChange(of: msg, perform: { newValue in
                        if msg == "Word found"{
                            viewRouting.state = .wordView
                            viewRouting.prevState = .userSetting
                        }
                    })
                    
                }
            }
            .modifier(Padding())
            Notification(check: isLoading, text: "Loading...")
        }
    }
}

struct UserSettings_Previews: PreviewProvider {
    static var previews: some View {
        UserSettings()
            .environmentObject(UserViewModel.obj)
    }
}
