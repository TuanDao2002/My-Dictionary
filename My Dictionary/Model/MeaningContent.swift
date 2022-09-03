//
//  MeaningContent.swift
//  My Dictionary
//
//  Created by Tuan Dao on 03/09/2022.
//

import Foundation

struct MeaningContent: Decodable, Hashable {
    var partOfSpeech: String
    var definitions: [DefinitionContent]
}
