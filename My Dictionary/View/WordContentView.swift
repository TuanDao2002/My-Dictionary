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
//                          Display header including word title, audio button and pronounciation note
                            WordContentHeader(word: wordVM.getWord())
                                .modifier(Padding())
                            Spacer()
                                .frame(height: 100)
//                          Display definition with synonyms and antonyms
                            Definition(synonyms: wordVM.getWord()?.synonyms ?? [], antonyms: wordVM.getWord()?.antonyms ?? [], definitions: wordVM.getWord()?.meanings[0].definitions ?? [])
                            Spacer()
                                .frame(height: 70)
//                          Display other definitions
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
