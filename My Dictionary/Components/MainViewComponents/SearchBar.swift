//
//  SearchBar.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

enum TextFieldFocus {
    case Search
}

struct SearchBar: View {
    @Binding var input: String
    @Binding var searchBarTouched: Bool
    
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var wordVM: WordViewModel
    @EnvironmentObject var viewRouting: ViewRouting
    
    @State private var msg: String = ""
    @State private var searchedClicked = false
    @State var word: Word?
    
    
    @FocusState var searchFieldFocus: TextFieldFocus?
    
    var body: some View {
        VStack{
            HStack {
                TextField("Search", text: $input)
//                    .frame(height: 55)
                    .padding(.horizontal, 50)
                    .opacity(searchBarTouched ? 1 : 0)
                    .modifier(TextFieldModifier())
                    .focused($searchFieldFocus, equals: .Search)
                
                    .background(Color("Hard-purple"))
                    .overlay(
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("Retro-Gray"))
                                .padding()
                                .onTapGesture {
                                    searchFieldFocus = nil
                                    withAnimation (.linear(duration: 0.25)){
                                        searchBarTouched = false
                                    }
                                }
                                .opacity(searchBarTouched ? 1 : 0)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color("Retro-Gray"))
                                .padding()
                                .onTapGesture {
                                    self.msg = "Loading..."
                                    searchedClicked = true
                                    wordVM.getWordDefinition(searchedWord: input) { msg, word in
                                        self.msg = msg
                                        self.word = word
                                    }
                                }
                        }
                            
                    )
                    .onTapGesture {
                        withAnimation (.linear(duration: 0.25)){
                            searchBarTouched = true

                        }
                    }
                    .onChange(of: searchBarTouched){
                        newValue in
                        if(newValue){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                searchFieldFocus = .Search
                            }
                        }
                    }
                    .onSubmit {
                        self.msg = "Loading..."
                        searchedClicked = true
                        wordVM.getWordDefinition(searchedWord: input) { msg, word in
                            self.msg = msg
                            self.word = word
                        }
                    }
            }
//            .padding(.vertical, 20)
            .overlay(
                Text("Tap here to search")
                    .foregroundColor(Color("Retro-Gray"))
                    .disabled(searchBarTouched ? true : false)
                    .opacity(searchBarTouched ? 0 : 1)
            )
            
            
            Button {
                if msg == "Word found"{
                    viewRouting.state = .wordView
                    viewRouting.prevState = .mainView
                }
            } label: {
                WordRow(title: word?.word ?? msg, userVM: userVM, msg: msg)
            }
            .frame(height: searchBarTouched ? nil : 0)
            .opacity(input.isEmpty ? 0 : 1)
            .onChange(of: input) { msg in
                if input.isEmpty{
                    self.msg = ""
                    word = nil
                    searchedClicked = false
                }
            }.opacity(searchedClicked && msg != "Please enter a word" && msg != "Please enter a valid English word" && msg != "Word not found" && msg != "Error" ? 1 : 0)
            
//            if (searchedClicked && msg != "Word found" && msg != "Loading...") {
//                Text(msg)
//            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(input: .constant(""), searchBarTouched: .constant(false))
    }
}
