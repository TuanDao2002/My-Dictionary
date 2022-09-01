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
            .accentColor(Color("Hard-purple"))
            .font(.custom("SpaceGrotesk-Regular", size: 20))
            .foregroundColor(.white)
            .cornerRadius(50)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(.black, lineWidth: 2))
    }
}
