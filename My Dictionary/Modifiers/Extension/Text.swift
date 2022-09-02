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
    
    func blackTitle() -> some View {
        self.font(.custom("SpaceGrotesk-Medium", size: 50))
            .foregroundColor(.black)
    }
    
    func blackDefinition() -> some View {
        self.font(.custom("SpaceGrotesk-Medium", size: 30))
            .foregroundColor(.black)
    }
    
    func buttonText() -> some View {
        self.font(.custom("SpaceGrotesk-SemiBold", size: 17))
            .foregroundColor(.white)
            .padding(.vertical, 15)
            .padding(.horizontal, 40)
    }
    
    func textFieldHeader() -> some View {
        self.font(.custom("SpaceGrotesk-SemiBold", size: 17))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
    }
    
    func subtitle() -> some View {
        self.font(.custom("SpaceGrotesk-SemiBold", size: 20))
            .foregroundColor(.black)
            .opacity(0.8)
    }
    
    func bodyText() -> some View{
        self.font(.custom("SpaceGrotesk-Regular", size: 20))
            .foregroundColor(.black)
    }
    
    func bodyHeader() -> some View{
        self.font(.custom("SpaceGrotesk-Medium", size: 20))
            .foregroundColor(.black)
    }
}
