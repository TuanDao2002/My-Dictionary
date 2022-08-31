//
//  SearchBlock.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct SearchBlock: View {
    @Binding var name: String
    @Binding var word: String
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome back").font(.custom("Inter", size: 40)).fontWeight(.bold)
            Text(name).font(.custom("Inter", size: 40)).fontWeight(.bold)
            Spacer()
            SearchBar(word: $word)
            Spacer()
        }
    }
}

struct SearchBlock_Previews: PreviewProvider {
    static var previews: some View {
        SearchBlock(name: .constant("Phi cunt"), word: .constant(""))
    }
}
