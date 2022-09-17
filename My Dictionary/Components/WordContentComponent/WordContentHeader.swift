//
//  WordContentHeader.swift
//  My Dictionary
//
//  Created by Bui Quang An on 02/09/2022.
//

import SwiftUI

struct WordContentHeader: View {
    var word: Word?
    @State var soundButtonTouched = false
    @State var isLoading = false
    @StateObject private var soundManager = SoundManager()
    
    @EnvironmentObject var wordVM: WordViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("\(word?.word.capitalized ?? "")")
                .blackTitle()
                .modifier(LeftAlign())
            HStack(spacing: 5){
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
                if isLoading {
                    Text("Loading...")
                        .subtitle()
                } else {
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
