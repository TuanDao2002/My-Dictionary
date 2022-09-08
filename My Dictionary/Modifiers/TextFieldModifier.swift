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
            .padding(.horizontal)
            .padding(.vertical, 13)
            .accentColor(Color("Purple"))
            .font(.custom("SpaceGrotesk-Regular", size: 15))
            .foregroundColor(.white)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.black, lineWidth: 2))
    }
}
