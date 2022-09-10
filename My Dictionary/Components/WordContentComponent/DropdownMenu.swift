//
//  DropdownMenu.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct DropdownMenu: View {
    @State var isExpanded = false
    @State var selectedForm = ""
    var word: Word?
    private var meanings: [MeaningContent]
    
    init(word: Word?){
        self.word = word
        meanings = word?.meanings ?? []
        selectedForm = meanings[0].partOfSpeech
    }
    
    var body: some View {
        Menu{
            ForEach(meanings, id: \.self){
                meaning in
                Button{
                    self.isExpanded.toggle()
                    selectedForm = meaning.partOfSpeech
                    UserDefaults.standard.set(selectedForm, forKey: "partOfSpeech")
                } label: {
                    Text("\(meaning.partOfSpeech)").padding()
                }.foregroundColor(.black).multilineTextAlignment(.trailing)
            }
        } label: {
            HStack{
                Text("\(selectedForm)")
                Image(systemName: "chevron.down")
            }.font(.system(size: 15)).opacity(0.7).foregroundColor(Color.black)
        }
    }
}

//struct DropdownMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        DropdownMenu().background(Color("Retro-Green"))
//    }
//}
