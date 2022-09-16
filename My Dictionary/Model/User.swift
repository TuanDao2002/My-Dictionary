/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Dao Kha Tuan
  ID: s3877347
  Created date: 30/08/2022
  Last modified: 16/09/2002
  Acknowledgement: Acknowledge the resources that you use here.
*/
import Foundation

// Model to store the information of a user including username, searched and favorite words
struct User: Codable, Identifiable {
    var id: String
    var username: String
    var searchedWords: [String]
    var favoriteWords: [String]
}
