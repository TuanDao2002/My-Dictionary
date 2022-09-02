//
//  Navigation.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        Label{
            Text("RETURN")
                .padding(.leading, 10)
                .font(.system(size: 20))
        } icon: {
            Image(systemName: "chevron.left")
        }
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(.black, lineWidth: 2))
    }
}
