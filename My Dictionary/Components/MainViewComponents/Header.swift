//
//  SearchBlock.swift
//  My Dictionary
//
//  Created by Bui Quang An on 31/08/2022.
//

import SwiftUI

struct Header: View {
    @Binding var name: String
 
    var body: some View {
        VStack(spacing: 10){
            Text("Welcome back")
                .title()
            Text(name)
                .title()
        }
        .foregroundColor(.white)
    }
}

struct SearchBlock_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Header(name: .constant("Phi cunt"))
        }
        .background(Color("Hard-purple"))
    }
}
