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
            HStack {
                Text("\(definition.definition)")
                    .bodyText()
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .frame(width: width - 60)
            Spacer()
            HStack {
                Text("Example: \(definition.example)")
                    .bodyText()
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .frame(width: width - 60)
        }
        .padding(30)
        .background(Color("Retro-Gray"))
        .cornerRadius(20)
    }
}
