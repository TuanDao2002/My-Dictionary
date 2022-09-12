//
//  MainView.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct MainView: View {
    // Global object to change view of app
    @EnvironmentObject var viewRouting: ViewRouting
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    
    @State var input = ""
    //    @State var user = User(id: "1", username: "Phi", searchedWords: ["favorite", "content", "word"], favoriteWords: [])
    
    @State private var user: User?
    @State var searchBarTouched = false
    @State var todayWord: String = ""
    @State var isLoading: Bool = false
    @State var title = ""
    @State var msg: String = ""
    @State var searchedClicked = false
    @State var word: Word?
    
    var body: some View {
        GeometryReader{
            g in
            VStack{
                //PROFILE NAVIGATION SECTION
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
                .padding(.top, 30)
                .modifier(RightAlign())
                .modifier(Hide(check: searchBarTouched))
                .modifier(Hide(check: !userVM.isLogin()))
                .foregroundColor(.black)
                
                
                Header()
                    .disabled(searchBarTouched)
                    .opacity(searchBarTouched ? 0 : 1)
//                Spacer()
                
                
                //SEARCH BAR SECTION
                SearchBar(input: $input, searchBarTouched: $searchBarTouched)
                    .offset(x: 0, y: searchBarTouched ? -(g.size.height / 6) : 0)
                
                Button(action: {
                    // Change to WordListHistory view
                    viewRouting.state = .historyView
                }, label: {
                    Text("Search history >>")
                        .foregroundColor(Color("Retro-Gray"))
                })
                    .modifier(Hide(check: searchBarTouched))
                    .modifier(Hide(check: !userVM.isLogin()))
                
                Spacer()
                
                
                //TODAY WORD SECTION
                Text("Today word: ")
                    .title()
                    .modifier(Hide(check: searchBarTouched))
                
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
                    WordRow(title: isLoading ? "Loading..." : todayWord, userVM: userVM, msg: msg)
                })
                .modifier(Hide(check: searchBarTouched))
                
            }
            .modifier(Padding())
            .padding(.bottom, 30)
        }
        .navigationBarHidden(true)
        .background(Color("Hard-purple"))
        .onTapGesture {
            withAnimation (.linear(duration: 0.25)){
                searchBarTouched = false
            }
        }
    
        .onAppear{
            isLoading = true
            wordVM.getTodayWord() { msg, status in
                todayWord = msg
                isLoading = false
            }
        }
    
        .onChange(of: self.msg) {
            newValue in
            if (self.msg == "Word found") {
                viewRouting.state = .wordView
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewRouting())
            .environmentObject(UserViewModel.obj)
    }
}
