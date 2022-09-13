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
    
    @FocusState private var searchFieldFocus: TextFieldFocus?
    
    var body: some View {
        GeometryReader{
            g in
            ZStack {
                //SEARCH BAR SECTION
                SearchBar(input: $input, searchBarTouched: $searchBarTouched, searchFieldFocus: _searchFieldFocus)
                    .offset(x: 0, y: searchBarTouched ? -(g.size.height / 3) : 0)
                
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
                    .padding(.top, 40)
                    .modifier(RightAlign())
                    .modifier(Hide(check: searchBarTouched))
                    .modifier(Hide(check: !userVM.isLogin()))
                    .foregroundColor(Color("Retro-Gray"))
                    
                    
                    Header()
                        .disabled(searchBarTouched)
                        .opacity(searchBarTouched ? 0 : 1)

                    
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
                    .frame(width: g.size.width - 60)
                    .overlay(RoundedRectangle(cornerRadius: 50)
                    .stroke(Color("Retro-Yellow"), lineWidth: 2))
                    .modifier(Hide(check: searchBarTouched))
                    
                }
            }
            
            .modifier(Padding())
            .padding(.bottom, 30)
        }
        .navigationBarHidden(true)
        .background(Color("Hard-purple"))
        .onTapGesture {
            withAnimation (.linear(duration: 0.25)){
                searchBarTouched = false
                searchFieldFocus = nil
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
