//
//  WordContentView.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct WordContentView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 50){
                WordContentHeader()
                Defination()
                DefinationCard()
            }.padding(40).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.background(Color("Retro-Green"))
    }
}

struct WordContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordContentView()
    }
}
