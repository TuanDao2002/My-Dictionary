/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Thai Manh Phi
  ID: s3878070
  Created date: 31/08/2022
  Last modified: 18/09/2002
  Acknowledgement: N/A
*/

import SwiftUI

//Text modifiers for main text
struct RightAlign: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct LeftAlign: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, alignment: .leading)
    }
}
