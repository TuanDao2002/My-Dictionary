/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Bui Quang An
  ID: s3877482
  Created date: 08/09/2022
  Last modified: 16/09/2002
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation
import AVFoundation

class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?
//  play sound through URL
    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}
