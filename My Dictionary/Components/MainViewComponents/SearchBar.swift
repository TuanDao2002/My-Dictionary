//
//  SearchBar.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var input: String
    @Binding var searchBarTouched:Bool
    var body: some View {
        //            HStack{
        //                Image(systemName: "magnifyingglass")
        //                    .frame(width: 30, height: 30)
        //                    .foregroundColor(Color("Retro-Red"))
        //                    .padding(.horizontal)
        //                TextField("Search here", text: $word)
        //                    .foregroundColor(.black)
        //            }
        //            .frame(height: 60)
        //            .background(Color("Retro-Gray"))
        //            .cornerRadius(15)
        //            .padding(20)
        
        HStack {
            TextField("Search here", text: $input)
                .padding()
                .padding(.horizontal, 30)
                .background(Color("Retro-Gray")).foregroundColor(.black)
                .cornerRadius(7.5)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("Retro-Red"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation (.linear(duration: 0.25)){
                        searchBarTouched = true
                    }
                }
        }
        
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(input: .constant(""), searchBarTouched: .constant(false))
    }
}
