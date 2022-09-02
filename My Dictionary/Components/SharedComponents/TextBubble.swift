//
//  TextBubble.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct TextBubble: View {
    var textArray: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                    .frame(width: 30)
                ForEach(textArray, id: \.self) {
                    textIndex in
                    Text(textIndex)
                        .bodyText()
                        .modifier(Padding())
                        .padding(.vertical, 10)
                        .background(Capsule().fill(Color("Retro-Gray")))
                }
            }
        }
    }
}

struct TextBubble_Previews: PreviewProvider {
    static var previews: some View {
        let textArray = ["hello", "hi", ":)))"]
        TextBubble(textArray: textArray)
    }
}
