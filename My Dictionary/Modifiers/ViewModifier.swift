//
//  ViewModifier.swift
//  My Dictionary
//
//  Created by Phi Thai on 12/09/2022.
//

import SwiftUI

struct Hide: ViewModifier {
    let check: Bool
    
    func body(content: Content) -> some View {
        content.opacity(check ? 0 : 1)
    }
}
