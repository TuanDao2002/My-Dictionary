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
    @State var word: Word?
    @EnvironmentObject var viewRouting: ViewRouting
    var body: some View {
        VStack{
            HStack {
                TextField("Search here", text: $input)
                    .padding(.horizontal, 30)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 60).opacity(searchBarTouched ? 1 : 0).font(.custom("Inter", size: 15))
                    .background(Color("Retro-Gray")).foregroundColor(.black)
                    .cornerRadius(7.5)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color("Retro-Red"))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                                .padding().onTapGesture {
                                    wordVM.getWordDefinition(searchedWord: input) { msg, word in
                                        self.msg = msg
                                        self.word = word
                                    }
                                }
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        withAnimation (.linear(duration: 0.25)){
                            searchBarTouched = true
                        }
                    }
            }
            
            Button {
                if msg == "Word found"{
                    viewRouting.state = .wordView
                }
            } label: {
                WordRow(title: word?.word ?? msg, userVM: userVM).frame(height: 50)
            }.padding(10).frame(height: searchBarTouched ? nil : 0).opacity(input.isEmpty ? 0 : !msg.isEmpty ? 1 : 0).onChange(of: input) { msg in
                if input.isEmpty{
                    self.msg = ""
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(input: .constant(""), searchBarTouched: .constant(false))
    }
}
