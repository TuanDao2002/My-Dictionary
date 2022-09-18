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

//Text bubble view for word content view
struct TextBubble: View {
    var textArray: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                    .frame(width: 30)
                ForEach(textArray, id: \.self) {
                    textIndex in
                    Text(textIndex)
                        .bodyText()
                        .modifier(Padding())
                        .padding(.vertical, 10)
                        .background(Capsule().fill(Color("Retro-Gray")))
                }
            }
        }
    }
}

//Preview for text bubble view
struct TextBubble_Previews: PreviewProvider {
    static var previews: some View {
        let textArray = ["hello", "hi", ":)))"]
        TextBubble(textArray: textArray)
    }
}
