//
//  WordContentView.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordContentView: View {
    @EnvironmentObject var viewRouting: ViewRouting
    @EnvironmentObject var wordVM: WordViewModel
    @State private var msg = ""
    
    var body: some View {
        ZStack {
            Color("Retro-Green")
                .ignoresSafeArea()
            VStack {
                WordContentNavigation(word: wordVM.getWord())
                    .modifier(Padding())
                
                GeometryReader {
                    geo in
                    ScrollView{
                        VStack{
                            Spacer()
                                .frame(height: 10)
                            WordContentHeader(word: wordVM.getWord())
                                .modifier(Padding())
                            Spacer()
                                .frame(height: 100)
                            Definition(synonyms: wordVM.getWord()?.synonyms ?? [], antonyms: wordVM.getWord()?.antonyms ?? [], definitions: wordVM.getWord()?.meanings[0].definitions ?? [])
                            Spacer()
                                .frame(height: 70)
                            DefinitionCardCollection(width: geo.size.width, meanings: wordVM.getWord()?.meanings ?? [])
                        }
                        
                    }
                    
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
