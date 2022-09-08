//
//  DefinitionContent.swift
//  My Dictionary
//
//  Created by Tuan Dao on 03/09/2022.
//

import Foundation

struct DefinitionContent: Codable, Hashable {    
    var definition: String
    var example: String = ""
}
