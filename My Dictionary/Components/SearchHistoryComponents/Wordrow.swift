//
//  TopWord.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordRow: View {
    var title: String
    var body: some View {
        HStack{
            Image(systemName: "star").foregroundColor(Color("Soft-purple")).padding(8).background(Color("Purple")).cornerRadius(100)
            Text(title).font(.custom("Inter", size: 15))
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(Color("Retro-Gray"))
        }.padding().background(.white).cornerRadius(10)
    }
}

struct TopWord_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            WordRow(title: "Student").background(.white)
        }.background(Color("Retro-Red"))
        
    }
}
