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

struct WordContentHeader: View {
    var word: Word?
    @State var soundButtonTouched = false
    @State var isLoading = false
    @StateObject private var soundManager = SoundManager()
    
    @EnvironmentObject var wordVM: WordViewModel
    var body: some View {
        VStack(alignment: .leading){
//          Display word title
            Text("\(word?.word.capitalized ?? "")")
                .blackTitle()
                .modifier(LeftAlign())
            HStack(spacing: 5){
//              Audio button
                Image(systemName: "speaker.wave.2.fill").onTapGesture {
                    isLoading = true
                    withAnimation() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            isLoading = false
                        }
                    }
                    soundManager.playSound(sound: word?.audio ?? "")
                    soundButtonTouched.toggle()
                    if soundButtonTouched{
                        soundManager.audioPlayer?.play()
                        soundButtonTouched = false
                    } else {
                        soundManager.audioPlayer?.pause()
                    }
                }
                .font(.system(size: 20))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(.black, lineWidth: 2))
                    .background(Color("Retro-Brown-Light"))
                    .cornerRadius(50)
//              Loading effect
                if isLoading {
                    Text("Loading...")
                        .subtitle()
                } else {
//                  Pronounciation note
                    Text("\(word?.text ?? "")")
                        .subtitle()
                }
            }.opacity(word?.audio == "" ? 0 : 1)
        }
    }
}

struct WordContentHeader_Previews: PreviewProvider {
    static var previews: some View {
        WordContentHeader().background(Color("Retro-Green"))
    }
}

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
