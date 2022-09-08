//
//  DropdownMenu.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct DropdownMenu: View {
    @State var isExpanded = false
    @State var selectedForm = "noun"
    var word: Word?
    private var meanings: [MeaningContent]
    
    init(word: Word?){
        self.word = word
        meanings = word?.meanings ?? []
    }
    
    var body: some View {
        //        Menu{
        //            Picker(selection: $selectedForm, label: Text("Sorting options")) {
        //                ForEach(meanings, id: \.self){
        //
        ////                    Button(meaning.partOfSpeech, action: {
        ////                        self.selectedForm = meaning.partOfSpeech
        //////                        UserDefaults.standard.set(meaning.partOfSpeech, forKey: "partOfSpeech")
        ////                    })
        //                    Text("\($0.partOfSpeech)")
        //                }
        //            }
        //        } label: {
        //            HStack{
        //                Text("\(selectedForm)")
        //                    .bodyText()
        //                Image(systemName: "chevron.down")
        //            }
        //            .font(.system(size: 15))
        //            .opacity(0.7)
        //            .foregroundColor(Color.black)
        //        }
        Menu{
            //            Button{
            //                self.isExpanded.toggle()
            //                selectedForm = "adjective"
            //            } label: {
            //                Text("adjective").padding()
            //            }.foregroundColor(.black).multilineTextAlignment(.trailing)
            //            Button {
            //                self.isExpanded.toggle()
            //                selectedForm = "verb"
            //            } label: {
            //                Text("verb").foregroundColor(.black).padding()
            //            }.foregroundColor(.black)
            //            Button {
            //                self.isExpanded.toggle()
            //                selectedForm = "adverb"
            //            } label: {
            //                Text("adverb").foregroundColor(.black).padding()
            //            }.foregroundColor(.black)
            ForEach(meanings, id: \.self){
                meaning in
                Button{
                    self.isExpanded.toggle()
                    selectedForm = meaning.partOfSpeech
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
