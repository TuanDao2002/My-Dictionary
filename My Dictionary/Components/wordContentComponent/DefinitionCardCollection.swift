//
//  DefinitionCardCollection.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct DefinitionCardCollection: View {
    let width: CGFloat
    
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
                    DefinitionCard(width: width - 60)
                }
            }
        }
    }
}

