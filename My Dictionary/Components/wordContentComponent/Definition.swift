//
//  Defination.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct Definition: View {
    var textArray = ["hello", "hi", ":)))", "Phi", ":)))",":)))",":)))"]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("\"Hello!\" or an equivalent greeting.")
                .blackDefinition()
                .opacity(0.7)
                .modifier(Padding())
            Spacer()
                .frame(height: 100)
            VStack(alignment: .leading){
                Text("synonyms:")
                    .bodyHeader()
                    .modifier(Padding())
                TextBubble(textArray: textArray)
                Text("antonyms:")
                    .bodyHeader()
                    .padding(.top, 20)
                    .modifier(Padding())
                TextBubble(textArray: textArray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Defination_Previews: PreviewProvider {
    static var previews: some View {
        Definition().background(Color("Retro-Green"))
    }
}
