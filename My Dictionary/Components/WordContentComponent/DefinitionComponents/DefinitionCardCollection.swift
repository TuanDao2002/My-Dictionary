//
//  DefinitionCardCollection.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct DefinitionCardCollection: View {
    let width: CGFloat
    var meanings: [MeaningContent]
    var body: some View {
        VStack{
            Text("Other meaning:")
                .bodyHeader()
                .modifier(Padding())
                .modifier(LeftAlign())
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer()
                        .frame(width: 30)
                    
                    ForEach(meanings, id: \.self){
                        meaning in
                        ForEach(meaning.definitions, id: \.self){
                            definition in
                            DefinitionCard(width: width - 60, definition: definition, partOfSpeech: meaning.partOfSpeech)
                                .padding(.trailing, 15)
                        }
                    }
                    
                    Spacer()
                        .frame(width: 30)
                    
                }
            }
        }
    }
}

