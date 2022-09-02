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
    var partOfSpeech = ["noun", "adjective", "verb"]
    
    var body: some View {
        Menu{
            Picker(selection: $selectedForm, label: Text("Sorting options")) {
                ForEach(partOfSpeech, id: \.self){
                    Button($0, action: {})
                }
            }
        } label: {
            HStack{
                Text("\(selectedForm)")
                    .bodyText()
                Image(systemName: "chevron.down")
            }
            .font(.system(size: 15))
            .opacity(0.7)
            .foregroundColor(Color.black)
        }
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu().background(Color("Retro-Green"))
    }
}
