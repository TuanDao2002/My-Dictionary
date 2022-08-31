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
            .background(Color("White"))
            .accentColor(Color("Soft-purple"))
            .foregroundColor(Color("Hard-purple"))
            .font(.body)
            .cornerRadius(10)
    }
}
