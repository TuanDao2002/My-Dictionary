//
//  Defination.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct Defination: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("\"Hello!\" or an equivalent greeting.").foregroundColor(.white)
            VStack(alignment: .leading, spacing: 10){
                Text("synonyms: greeting").font(.headline).fontWeight(.semibold).frame(width: 216, alignment: .leading)
                Text("antonyms: []").font(.headline).fontWeight(.semibold)
            }
        }.padding().frame(maxWidth: .infinity, alignment: .leading).font(.custom("Inter", size: 20))
    }
}

struct Defination_Previews: PreviewProvider {
    static var previews: some View {
        Defination().background(Color("Retro-Green"))
    }
}
