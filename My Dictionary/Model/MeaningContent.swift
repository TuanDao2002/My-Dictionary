//
//  MeaningContent.swift
//  My Dictionary
//
//  Created by Tuan Dao on 03/09/2022.
//

import Foundation

// Model to display all definitions of a word based on its part of speech
struct MeaningContent: Codable, Hashable {
    var partOfSpeech: String
    var definitions: [DefinitionContent]
}
