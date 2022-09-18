/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Bui Quang An
  ID: s3877482
  Created date: 02/09/2022
  Last modified: 16/09/2002
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct DefinitionCard: View {
    let width: CGFloat
    var definition: DefinitionContent
    var partOfSpeech: String
    var body: some View {
        VStack(alignment: .leading){
//          Display part of speech
            Text("\(partOfSpeech)")
                .padding(.horizontal, 13)
                .padding(.vertical, 7)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(.black, lineWidth: 1))
                .foregroundColor(.black)
            HStack {
//              Display word definition
                Text("\(definition.definition)")
                    .bodyText()
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
                Spacer()
            }
            .frame(width: width - 60)
            Spacer()
            if(definition.example != ""){
                Divider()
                HStack {
//                  Display example
                    Text("Example: \(definition.example)")
                        .subText()
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .frame(width: width - 60)
            }
        }
        .padding(30)
        .background(Color("Retro-Gray"))
        .cornerRadius(20)
    }
}
