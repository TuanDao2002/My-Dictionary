//
//  WordContentHeader.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct WordContentHeader: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(alignment: .center){
                Image(systemName: "chevron.left").foregroundColor(.white)
                Spacer()
                DropdownMenu().padding(.vertical)
            }.font(.custom("", size: 20))
            
            Text("Hello").multilineTextAlignment(.leading).font(.custom("Inter", size: 50))
            HStack(spacing: 5){
                Image(systemName: "speaker.wave.2.fill").font(.custom("", size: 30))
                Text("/həˈləʊ/").font(.custom("Inter", size: 15))
            }
        }.padding().frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct WordContentHeader_Previews: PreviewProvider {
    static var previews: some View {
        WordContentHeader().background(Color("Retro-Green"))
    }
}
