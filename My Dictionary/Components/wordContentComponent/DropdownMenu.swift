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
    var body: some View {
                        Menu{
                            Button{
                                self.isExpanded.toggle()
                                selectedForm = "adjective"
                            } label: {
                                Text("adjective").padding()
                            }.foregroundColor(.black).multilineTextAlignment(.trailing)
                            Button {
                                self.isExpanded.toggle()
                                selectedForm = "verb"
                            } label: {
                                Text("verb").foregroundColor(.black).padding()
                            }.foregroundColor(.black)
                            Button {
                                self.isExpanded.toggle()
                                selectedForm = "adverb"
                            } label: {
                                Text("adverb").foregroundColor(.black).padding()
                            }.foregroundColor(.black)
                        } label: {
                            HStack{
                                Text("\(selectedForm)")
                                Image(systemName: "chevron.down")
                            }.foregroundColor(Color("Retro-Gray"))
                        }
            }
        }

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu().background(Color("Retro-Green"))
    }
}
