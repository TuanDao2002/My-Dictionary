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
            .padding()
            .background(Color("Retro-Gray"))
            .accentColor(Color("Hard-purple"))
            .foregroundColor(Color("Retro-Red"))
            .font(.subheadline)
            .cornerRadius(10)
    }
}
