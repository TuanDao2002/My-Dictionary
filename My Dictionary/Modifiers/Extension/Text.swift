/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Thai Manh Phi
  ID: s3878070
  Created date: 1/09/2022
  Last modified: 18/09/2002
  Acknowledgement: N/A
*/

import Foundation
import SwiftUI

//Extension for the Text of swiftUI for consistency betwen elements in the application
extension Text {
    func customFont(size: Double) -> some View {
        self.font(.custom("SpaceGrotesk-Regular", size: size))
    }
    
    func title() -> some View {
        self.font(.custom("SpaceGrotesk-Medium", size: 50))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func darkTitle() -> some View {
        self.font(.custom("SpaceGrotesk-Medium", size: 50))
            .foregroundColor(Color("Dark-Green"))
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
    
    func subText() -> some View{
        self.font(.custom("SpaceGrotesk-Regular", size: 17))
            .foregroundColor(.black)
    }
    
    func subText2() -> some View{
        self.font(.custom("SpaceGrotesk-Regular", size: 17))
            .foregroundColor(Color("Retro-Gray"))
    }
}
