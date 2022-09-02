//
//  MainView.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct MainView: View {
    @State var name = "Phi cunt"
    @State var input = ""
    @State var user = User(id: "1", username: "Phi", searchedWords: ["favorite", "content", "word"], favoriteWords: [])
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Header(name: $name)
                Spacer()
                    .frame(height: 60)
                SearchBar(word: $input)
                NavigationLink("Search history >>", destination: WordListHistory(user: $user))
                    .foregroundColor(Color("Retro-Gray"))
                Spacer()
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color("Hard-purple"))
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
