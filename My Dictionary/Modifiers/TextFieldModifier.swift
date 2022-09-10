//
//  TextFieldModifier.swift
//  My Dictionary
//
//  Created by Phi Thai on 31/08/2022.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(PlainTextFieldStyle())
            .padding(.leading, 17)
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 55)
            .accentColor(Color("Purple"))
            .font(.custom("SpaceGrotesk-Regular", size: 15))
            .foregroundColor(.white)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 2))
    }
}
