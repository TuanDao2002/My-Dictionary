//
//  WordContentView.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordContentView: View {
    @EnvironmentObject var viewRouting: ViewRouting
    @State private var input = UserDefaults.standard.string(forKey: "word") ?? ""
    @EnvironmentObject var wordVM: WordViewModel
    @State private var msg = ""
    @State private var word: Word?
    
    var body: some View {
        ZStack {
            Color("Retro-Green")
                .ignoresSafeArea()
            VStack {
                WordContentNavigation(word: word)
                    .modifier(Padding())
                    .padding(.top, 30)
                
                GeometryReader {
                    geo in
                    ScrollView{
                        VStack{
                            Spacer()
                                .frame(height: 10)
                            WordContentHeader(word: word)
                                .modifier(Padding())
                            Spacer()
                                .frame(height: 100)
                            Definition()
                            Spacer()
                                .frame(height: 70)
                            DefinitionCardCollection(width: geo.size.width)
                        }
                        
                    }
                    
                }
            }.onAppear {
                wordVM.getWordDefinition(searchedWord: input) { msg, word in
                    self.msg = msg
                    self.word = word
                }
            }
        }
    }
}

struct WordContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordContentView()
    }
}
