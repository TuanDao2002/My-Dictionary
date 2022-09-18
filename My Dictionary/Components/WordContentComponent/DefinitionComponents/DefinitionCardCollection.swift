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

//The collection of Definition Card for the word content view. This include the section for the "other meaning"
struct DefinitionCardCollection: View {
    let width: CGFloat
    var meanings: [MeaningContent]
    var body: some View {
        VStack{
            Text("Other meaning:")
                .bodyHeader()
                .modifier(Padding())
                .modifier(LeftAlign())
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer()
                        .frame(width: 30)
                    
                    ForEach(meanings, id: \.self){
                        meaning in
                        ForEach(meaning.definitions, id: \.self){
                            definition in
                            DefinitionCard(width: width - 60, definition: definition, partOfSpeech: meaning.partOfSpeech)
                                .padding(.trailing, 15)
                        }
                    }
                    
                    Spacer()
                        .frame(width: 30)
                    
                }
            }
        }
    }
}

