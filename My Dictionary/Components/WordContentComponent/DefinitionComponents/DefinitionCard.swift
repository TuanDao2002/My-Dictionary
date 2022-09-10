//
//  DefinationCard.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct DefinitionCard: View {
    let width: CGFloat
    var definition: DefinitionContent
    var partOfSpeech: String
    var body: some View {
        VStack(alignment: .leading){
            Text("\(partOfSpeech)")
                .padding(.horizontal, 13)
                .padding(.vertical, 7)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(.black, lineWidth: 1))
            HStack {
                Text("\(definition.definition)")
                    .bodyText()
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                Spacer()
            }
            .frame(width: width - 60)
            Spacer()
            if(definition.example != ""){
                Divider()
                HStack {
                    Text("Example: \(definition.example)")
                        .subText()
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .frame(width: width - 60)
            }
        }
        .padding(30)
        .background(Color("Retro-Gray"))
        .cornerRadius(20)
    }
}
