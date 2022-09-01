//
//  Text.swift
//  My Dictionary
//
//  Created by Phi Thai on 01/09/2022.
//

import Foundation
import SwiftUI

extension Text {

    func title() -> some View {
        self.font(.custom("SpaceGrotesk-Medium", size: 50))
            .foregroundColor(.white)
    }

    func buttonText() -> some View {
        self.font(.custom("SpaceGrotesk-Regular", size: 20))
            .foregroundColor(.white)
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
    }
    
    func textFieldHeader() -> some View {
        self.font(.custom("SpaceGrotesk-SemiBold", size: 20))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
    }
}
