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
    
    @StateObject var network = Network()
    
    var body: some View {
        GeometryReader{
            g in
            ZStack {
                Group {
                    VStack{
                        Spacer()
                        //SEARCH BAR SECTION
                        SearchBar(input: $input, searchBarTouched: $searchBarTouched, searchFieldFocus: _searchFieldFocus)
                            .offset(x: 0, y: searchBarTouched ? -(g.size.height / 3) : 0)
                        Spacer()
                        Spacer()
                    }
                    VStack{
                        //PROFILE NAVIGATION SECTION
                        ProfileButton(searchBarTouched: searchBarTouched)
                        
                        
                        //HEADER SECTION
                        Header()
                            .disabled(searchBarTouched)
                            .opacity(searchBarTouched ? 0 : 1)
                        
                        Spacer()
                            .frame(height: (g.size.height/4))
                        Spacer()
                        
                        
                        //TODAY WORD SECTION
                        TodayWordButton(searchBarTouched: $searchBarTouched, todayWord: todayWord, isLoading: $isLoading, msg: $msg, searchedClicked: $searchedClicked, word: $word, width: g.size.width)
                    }
                }
                
                .modifier(Padding())
                .padding(.bottom, 30)
                Notification(check: !network.connected, text: "Please connect to network to continue")
                    .frame(width: g.size.width, height: g.size.height)
            }
            
        }
        .navigationBarHidden(true)
        .background(Color("Hard-purple"))
        .onTapGesture {
            withAnimation (.linear(duration: 0.25)){
                input = ""
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
