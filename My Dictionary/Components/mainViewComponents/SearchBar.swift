//
//  SearchBar.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var word: String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass").frame(width: 30, height: 30)
                .foregroundColor(Color("Retro-Red"))
                .padding(.horizontal)
            TextField("Search here", text: $word)
                .foregroundColor(.black)
        }
            .frame(width:.infinity, height: 60)
            .background(Color("Retro-Gray"))
            .cornerRadius(15)
            .padding(20)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(word: .constant(""))
    }
}
