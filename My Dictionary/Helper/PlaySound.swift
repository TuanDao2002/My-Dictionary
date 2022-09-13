//
//  playSound.swift
//  My Dictionary
//
//  Created by Bui Quang An on 08/09/2022.
//

import Foundation
import AVFoundation

class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
