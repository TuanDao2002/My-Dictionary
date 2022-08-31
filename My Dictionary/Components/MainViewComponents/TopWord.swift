//
//  TopWord.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct TopWord: View {
    var word: Word
    var body: some View {
            NavigationLink(destination: WordContentView(word: word), label: {
                HStack{
                    Image(systemName: "star").padding().foregroundColor(Color("Hard-purple")).background(Color("Purple")).cornerRadius(100).padding()
                    Spacer()
                    Text(word.title).foregroundColor(.black).font(.custom("Inter", size: 25)).padding(.horizontal)
                    Spacer()
                    Image("arrow-forward").foregroundColor(.gray).padding()
                }
            }).frame(maxWidth: .infinity).background(Color("White")).cornerRadius(10).padding(.horizontal)
        
    }
}

struct TopWord_Previews: PreviewProvider {
    static var previews: some View {
        TopWord(word: Word(title: "Student"))
    }
}
