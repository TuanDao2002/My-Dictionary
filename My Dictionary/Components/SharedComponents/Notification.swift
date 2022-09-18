/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Thai Manh Phi
  ID: s3878070
  Created date: 08/09/2022
  Last modified: 18/09/2002
  Acknowledgement: N/A
*/

import SwiftUI

//Notification view for all view to handle loading or showing any message to the user
struct Notification: View {
    var check: Bool
    var text: String
    
    var body: some View {
        if check {
            ZStack {
                Color.black.opacity(check ? 0.9 : 0)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Retro-Skin")
                    Text(text)
                    .padding()
                }
                .frame(width: 200, height: 100)
                .cornerRadius(20)
                
            }
        }
    }
}
