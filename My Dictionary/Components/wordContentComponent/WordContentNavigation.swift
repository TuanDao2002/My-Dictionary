//
//  WordContentNavigation.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct WordContentNavigation: View {
    var body: some View {
        HStack(alignment: .center){
            Label{
                Text("RETURN")
                    .padding(.leading, 10)
            } icon: {
                Image(systemName: "chevron.left")
            }
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(.black, lineWidth: 2))
            Spacer()
            DropdownMenu()
        }
        .font(.custom("", size: 20))
    }
}

struct WordContentNavigation_Previews: PreviewProvider {
    static var previews: some View {
        WordContentNavigation()
    }
}
