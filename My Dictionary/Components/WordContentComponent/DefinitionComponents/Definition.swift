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

struct Definition: View {
    var synonyms: [String]
    var antonyms: [String]
    var definitions: [DefinitionContent]
    var body: some View {
        VStack(alignment: .leading){
//          Display the definition
            Text(definitions[0].definition)
                .blackDefinition()
                .opacity(0.7)
                .modifier(Padding())
            Spacer()
                .frame(height: 100)
//          Display synonyms and antonyms
            VStack(alignment: .leading){
                Text("synonyms:")
                    .bodyHeader()
                    .modifier(Padding()).opacity(!synonyms.isEmpty ? 1 : 0)
                TextBubble(textArray: synonyms)
                Text("antonyms:")
                    .bodyHeader()
                    .padding(.top, 20)
                    .modifier(Padding()).opacity(!antonyms.isEmpty ? 1 : 0)
                TextBubble(textArray: antonyms)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
