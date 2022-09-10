//
//  SearchBar.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var input: String
    @Binding var searchBarTouched:Bool
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @State private var msg: String = ""
    @State private var searchedClicked = false
    @State var word: Word?
    @EnvironmentObject var viewRouting: ViewRouting
    var body: some View {
        VStack{
            HStack {
                TextField("Search here", text: $input)
                    .padding(.horizontal, 50)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 60).opacity(searchBarTouched ? 1 : 0).font(.custom("Inter", size: 15))
                    .background(Color("Retro-Gray")).foregroundColor(.black)
                    .cornerRadius(7.5)
                    .overlay(
                        HStack {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color("Retro-Red"))
                                .frame(alignment: .leading)
                                .padding().onTapGesture {
                                    withAnimation (.linear(duration: 0.25)){
                                        searchBarTouched = false
                                    }
                                }.opacity(searchBarTouched ? 1 : 0)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color("Retro-Red"))
                                .frame(alignment: .trailing)
                                .padding().onTapGesture {
                                    self.msg = "Loading..."
                                    searchedClicked = true
                                    wordVM.getWordDefinition(searchedWord: input) { msg, word in
                                        self.msg = msg
                                        self.word = word
                                    }
                                }
                        }.frame( maxWidth: .infinity)
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        withAnimation (.linear(duration: 0.25)){
                            searchBarTouched = true
                        }
                    }
            }.overlay(
                Text("Tap here to search").foregroundColor(Color("Retro-Green")).disabled(searchBarTouched ? true : false).opacity(searchBarTouched ? 0 : 1)
            )
            
            Button {
                if msg == "Word found"{
                    viewRouting.state = .wordView
                    viewRouting.prevState = .mainView
                }
            } label: {
                WordRow(title: word?.word ?? msg, userVM: userVM, msg: msg)
            }.padding(10).frame(height: searchBarTouched ? nil : 0).opacity(input.isEmpty ? 0 : 1).onChange(of: input) { msg in
                if input.isEmpty{
                    self.msg = ""
                    word = nil
                    searchedClicked = false
                }
            }.opacity(searchedClicked && msg != "Please enter a word" && msg != "Please enter a valid English word" ? 1 : 0)
            
            if (searchedClicked && msg != "Word found" && msg != "Loading...") {
                Text(msg)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(input: .constant(""), searchBarTouched: .constant(false))
    }
}
