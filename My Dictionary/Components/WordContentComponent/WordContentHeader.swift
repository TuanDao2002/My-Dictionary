//
//  WordContentHeader.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct WordContentHeader: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Hello")
                .blackTitle()
                .modifier(LeftAlign())
            HStack(spacing: 5){
                Image(systemName: "speaker.wave.2.fill")
                    .font(.system(size: 30))
                Text("/həˈləʊ/")
                    .subtitle()
            }
        }
    }
}

struct WordContentHeader_Previews: PreviewProvider {
    static var previews: some View {
        WordContentHeader().background(Color("Retro-Green"))
    }
}
