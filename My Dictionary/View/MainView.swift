//
//  MainView.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct MainView: View {
    @State var name = "Phi cunt"
    @State var word = ""
    var body: some View {
        ZStack{
            Image("background")
            VStack{
                SearchBlock(name: $name, word: $word)
                
            }
        }.background(Color("Hard-purple")).cornerRadius(20).foregroundColor(Color("White"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
