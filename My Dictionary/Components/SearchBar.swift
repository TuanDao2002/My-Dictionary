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
            Image(systemName: "magnifyingglass").frame(width: 30, height: 30).foregroundColor(Color("Soft-purple")).background(Color("Purple")).cornerRadius(5).padding(.horizontal)
            TextField("Search here", text: $word)
        }.frame(width: 270, height: 60).background(Color("White")).cornerRadius(15)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(word: .constant(""))
    }
}
