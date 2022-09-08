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
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("\(definition.definition)")
                .bodyText()
            Spacer()
            HStack{
                Text("Example:")
                    .bodyText()
                Text("\(definition.example)")
                    .bodyText()
            }
        }
        .padding(30)
        .frame(width: width)
        .background(Color("Retro-Gray"))
        .cornerRadius(20)
    }
}
