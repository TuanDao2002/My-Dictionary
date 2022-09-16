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

// View Model to fetch data of a word from API
final class WordViewModel: ObservableObject {
    private var userVM: UserViewModel
    
    init() {
        userVM = UserViewModel.obj
    }
    
    // function to save word to UserDefault
    private func saveWord(word: Word?) {
        if (word == nil) {
            UserDefaults.standard.set(nil, forKey: "word")
            return
        }
        do {
            let wordData = try JSONEncoder().encode(word)
            UserDefaults.standard.set(wordData, forKey: "word")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // function to get word from UserDefault
    func getWord() -> Word?{
        if let wordData = UserDefaults.standard.data(forKey: "word") {
            do {
                return try JSONDecoder().decode(Word.self, from: wordData)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
    
    // function to add a word to list of searched words and favorite words of a user
    private func addWord(userId: String, word: String, endpoint: String, completion: @escaping(String, Int) -> ()) {
        if (word == "") {
            completion("No word is entered!", 404)
            return
        }
        var jsonData: [String: Any]?
        if (endpoint == "/word/addSearchedWord") {
            jsonData = ["userId": userId, "searchedWord": word]
        } else if (endpoint == "/word/addFavoriteWord") {
            jsonData = ["userId": userId, "favoriteWord": word]
        }
        
        let postRequest = postRequest(endpoint: endpoint, json: jsonData!)
        
        var user: User?
        let session = URLSession.shared
        session.dataTask(with: postRequest) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                
                if (response.statusCode != 200) {
                    let apiResponse = try? JSONDecoder().decode(Response.self, from: data)
                    completion(apiResponse!.msg, response.statusCode)
                    return
                }
                
                user = try? JSONDecoder().decode(User.self, from: data)
                self.userVM.saveUser(user: user)
                completion("Word is added", response.statusCode)
                
            } else {
                completion(error!.localizedDescription, 404)
            }
        }.resume()
    }
    
    // function to add a word to list of searched words of a user
    func addSearchedWord(userId: String, word: String, completion: @escaping(String, Int) -> ()) {
        addWord(userId: userId, word: word, endpoint: "/word/addSearchedWord", completion: completion)
    }
    
    // function to add a word to list of favorite words of a user
    func addFavoriteWord(userId: String, word: String, completion: @escaping(String, Int) -> ()) {
        addWord(userId: userId, word: word, endpoint: "/word/addFavoriteWord", completion: completion)
    }
    
    // function to remove a word from list of favorite words of a user
    func removeFavoriteWord(userId: String, word: String, completion: @escaping(String, Int) -> ()) {
        let jsonData = ["userId": userId, "favoriteWord": word]
        let postRequest = postRequest(endpoint: "/word/removeFavoriteWord", json: jsonData)

        var user: User?
        let session = URLSession.shared
        session.dataTask(with: postRequest) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                
                if (response.statusCode != 200) {
                    let apiResponse = try? JSONDecoder().decode(Response.self, from: data)
                    completion(apiResponse!.msg, response.statusCode)
                    return
                }
                
                user = try? JSONDecoder().decode(User.self, from: data)
                self.userVM.saveUser(user: user)
                completion("Word is removed", response.statusCode)
                
            } else {
                completion(error!.localizedDescription, 404)
            }
        }.resume()
    }
    
    // get the today word
    func getTodayWord(completion: @escaping(String, Int) -> ()) {
        let getRequest = getRequest(endpoint: "/word/getTodayWord")
        let session = URLSession.shared
        session.dataTask(with: getRequest!) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                
                if (response.statusCode != 200) {
                    let apiResponse = try? JSONDecoder().decode(Response.self, from: data)
                    completion(apiResponse!.msg, response.statusCode)
                    return
                }
                
                let todayWord = try? JSONDecoder().decode(TodayWord.self, from: data)
                completion(todayWord?.word ?? "", response.statusCode)
                
            } else {
                completion(error!.localizedDescription, 404)
            }
        }.resume()
    }
    
    // get the definition of a word
    func getWordDefinition(searchedWord: String, completion: @escaping(String, Word?) -> ()) {
        if (searchedWord == "") {
            completion("Please enter a word", nil)
            return
        }
        let convertToUrl = searchedWord.replacingOccurrences(of: " ", with: "-").lowercased()
        let getRequest = getRequest(endpoint: "/word/getWordDefinition/" + convertToUrl)
        if (getRequest == nil) {
            completion("Please enter a valid English word", nil)
            return
        }
        let session = URLSession.shared
        session.dataTask(with: getRequest!) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                
                if (response.statusCode != 200) {
                    completion("Word not found", nil)
                    return
                }
                
                let word = try? JSONDecoder().decode(Word.self, from: data)
                self.saveWord(word: word)
                self.addSearchedWord(userId: self.userVM.getUser()?.id ?? "", word: searchedWord) { msg, status in }
                completion("Word found", word)
            } else {
                completion("Error", nil)
            }
        }.resume()
    }
}
