/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Thai Manh Phi
  ID: s3878070
  Created date: 02/09/2022
  Last modified: 18/09/2002
  Acknowledgement: N/A
*/

import SwiftUI

//Navigation view for all view inside the application
struct Navigation: View {
    var body: some View {
        Label{
            Text("RETURN")
                .customFont(size: 20)
                .padding(.leading, 10)
        } icon: {
            Image(systemName: "chevron.left")
        }
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .overlay(RoundedRectangle(cornerRadius: 50).stroke(.black, lineWidth: 2))
                .padding(.top, 40)
                .foregroundColor(.black)
                .modifier(LeftAlign())
    }
}
