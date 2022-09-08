//
//  Word.swift
//  My Dictionary
//
//  Created by Tuan Dao on 30/08/2022.
//

import Foundation

struct Word: Codable {
    var word: String
    var text: String = ""
    var audio: String = ""
    var synonyms: [String] = []
    var antonyms: [String] = []
    var meanings: [MeaningContent]
}
