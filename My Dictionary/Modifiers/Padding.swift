//
//  ThreePadding.swift
//  My Dictionary
//
//  Created by Phi Thai on 02/09/2022.
//

import SwiftUI

struct Padding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 30)
    }
}

