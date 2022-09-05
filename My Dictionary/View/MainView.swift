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
    
    @State var input = ""
//    @State var user = User(id: "1", username: "Phi", searchedWords: ["favorite", "content", "word"], favoriteWords: [])
    
    @State private var user: User?
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Header()
                Spacer()
                    .frame(height: 60)
                
                // Create searchView for this one before putting routing into it!
                SearchBar(word: $input)
                
                Button(action: {
                    // Change to WordListHistory view
                    viewRouting.state = .historyView
                }, label: {
                    Text("Search history >>")
                        .foregroundColor(Color("Retro-Gray"))
                })
                
                Button(action: {
                    // Change to WordListHistory view
                    viewRouting.state = .userSetting
                }, label: {
                    Text("Setting >>")
                        .foregroundColor(Color("Retro-Gray"))
                })
                Button(action: {
                    // Change to WordListHistory view
                    viewRouting.state = .test
                }, label: {
                    Text("Setting >>")
                        .foregroundColor(Color("Retro-Gray"))
                })
                Spacer()
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color("Hard-purple"))
            .edgesIgnoringSafeArea(.all)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewRouting())
            .environmentObject(UserViewModel.obj)
    }
}
