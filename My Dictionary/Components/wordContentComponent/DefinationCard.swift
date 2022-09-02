//
//  DefinationCard.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct DefinationCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("A greeting (salutation) said when meeting someone or acknowledging someone’s arrival or presence.")
            Spacer()
            Text("synonyms: greeting").font(.headline).fontWeight(.semibold).frame(width: 216, alignment: .leading)
            Text("antonyms: []").font(.headline).fontWeight(.semibold)
            Spacer()
            HStack{
                Text("example:")
                Text("Hello everyone").font(Font.system(size: 15).italic())
            }
        }.padding().frame(width: .infinity, height: 280).background(Color("Retro-Gray")).cornerRadius(20)
    }
}

struct DefinationCard_Previews: PreviewProvider {
    static var previews: some View {
        DefinationCard()
    }
}
