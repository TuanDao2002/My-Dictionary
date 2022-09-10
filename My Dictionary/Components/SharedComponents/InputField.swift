//
//  InputField.swift
//  My Dictionary
//
//  Created by Phi Thai on 08/09/2022.
//

import SwiftUI

struct InputField: View {
    var header: String
    var textFieldName: String
    @Binding var name: String
    
    var body: some View {
        Text("\(header):")
            .textFieldHeader()
        TextField("\(textFieldName)", text: $name)
            .modifier(TextFieldModifier())
            .disableAutocorrection(true)
    }
}

struct PasswordField: View {
    var header: String
    var textFieldName: String
    @Binding var name: String
    
    var body: some View {
        Text("\(header):")
            .textFieldHeader()
        SecureField("\(textFieldName)", text: $name)
            .modifier(TextFieldModifier())
            .disableAutocorrection(true)
    }
}
