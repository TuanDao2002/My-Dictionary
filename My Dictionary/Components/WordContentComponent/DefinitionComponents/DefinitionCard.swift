//
//  DefinationCard.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct DefinitionCard: View {
    let width: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("A greeting (salutation) said when meeting someone or acknowledging someone’s arrival or presence.")
                .bodyText()
            Spacer()
            HStack{
                Text("Example:")
                    .bodyText()
                Text("Hello everyone")
                    .bodyText()
            }
        }
        .padding(30)
        .frame(width: width)
        .background(Color("Retro-Gray"))
        .cornerRadius(20)
    }
}
