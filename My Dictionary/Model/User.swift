//
//  User.swift
//  My Dictionary
//
//  Created by Tuan Dao on 30/08/2022.
//

import Foundation
struct User: Codable, Identifiable {
    var id: String
    var username: String
    var searchedWords: [String]
    var favoriteWords: [String]
}
