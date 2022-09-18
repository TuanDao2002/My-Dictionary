/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Bui Quang An
  ID: s3877482
  Created date: 02/09/2022
  Last modified: 16/09/2002
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

enum TextFieldFocus {
    case Search
}

struct SearchBar: View {
    @Binding var input: String
    @Binding var searchBarTouched: Bool
    
    // Global object to change view of app
    
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
//              Input field
                TextField("", text: $input)
                    .padding(.horizontal, 50)
                    .modifier(Hide(check: !searchBarTouched))
                    .modifier(TextFieldModifier())
                    .focused($searchFieldFocus, equals: .Search)
                
                    .background(Color("Hard-purple"))
                    .overlay(
                        HStack {
//                          "Back" button
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("Retro-Gray"))
                                .padding()
                                .onTapGesture {
                                    searchFieldFocus = nil
                                    withAnimation (.linear(duration: 0.25)){
                                        searchBarTouched = false
                                    }
                                }
                                .modifier(Hide(check: !searchBarTouched))
                            Spacer()
//                          "Search" button
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
//                      Loading effect
                        self.msg = "Loading..."
                        searchedClicked = true
                        wordVM.getWordDefinition(searchedWord: input) { msg, word in
                            self.msg = msg
                            self.word = word
                        }
                    }
                
            }
            .overlay(
                Text("Tap here to search")
                    .subText2()
                    .disabled(searchBarTouched ? true : false)
                    .modifier(Hide(check: searchBarTouched))
            )
            .padding(.top, 120)
            
            HStack {
                Spacer()
                Button(action: {
                    // Change to WordListHistory view
                    viewRouting.state = .historyView
                }, label: {
                    Text("Search history")
                        .subText2()
                    Image(systemName: "chevron.right")
                })
                .foregroundColor(Color("Retro-Gray"))
                .modifier(Hide(check: !searchBarTouched))
                .modifier(Hide(check: !userVM.isLogin()))
                
            }
            .padding(.bottom, 30)
            
            //DISPLAY WORD ON SEARCH OR MESSAGE
            if msg == "Word found"{
                Button {
                    viewRouting.state = .wordView
                    viewRouting.prevState = .mainView
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
                }
                .modifier(Hide(check: !searchedClicked))
            } else {
                HStack {
                    Spacer()
                    Text(msg)
                        .subText()
                    Spacer()
                }
                .frame(height: 65)
                .background(Color("Retro-Gray"))
                .cornerRadius(10)
                .modifier(Hide(check: !searchBarTouched))
                .modifier(Hide(check: !searchedClicked))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(input: .constant(""), searchBarTouched: .constant(false))
    }
}
