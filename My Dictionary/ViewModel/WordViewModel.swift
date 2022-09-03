//
//  WordViewModel.swift
//  My Dictionary
//
//  Created by Tuan Dao on 30/08/2022.
//

import Foundation

final class WordViewModel: ObservableObject {
    @Published var word: Word?
    private var userVM: UserViewModel
    
    init() {
        userVM = UserViewModel.obj
    }
    
    private func addWord(userId: String, word: String, endpoint: String, completion: @escaping(String, Int) -> ()) {
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
    
    func addSearchedWord(userId: String, word: String, completion: @escaping(String, Int) -> ()) {
        addWord(userId: userId, word: word, endpoint: "/word/addSearchedWord", completion: completion)
    }
    
    func addFavoriteWord(userId: String, word: String, completion: @escaping(String, Int) -> ()) {
        addWord(userId: userId, word: word, endpoint: "/word/addFavoriteWord", completion: completion)
    }
    
    func getTodayWord(completion: @escaping(String, Int) -> ()) {
        let getRequest = getRequest(endpoint: "/word/getTodayWord")
        let session = URLSession.shared
        session.dataTask(with: getRequest) { (data, response, error) in
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
}
