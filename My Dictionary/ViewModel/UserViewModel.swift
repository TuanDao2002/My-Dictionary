//
//  UserViewModel.swift
//  My Dictionary
//
//  Created by Tuan Dao on 30/08/2022.
//

import Foundation

struct Response: Decodable {
    var msg: String
}

let api = "https://cosc2659dictionary.herokuapp.com/api"

final class UserViewModel: ObservableObject {
    @Published var user: User?
    
    init() {
        self.user = getUser()
    }
    
    private func getUser() -> User?{
        if let userData = UserDefaults.standard.data(forKey: "user") {
            do {
                return try JSONDecoder().decode(User.self, from: userData)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
    
    private func saveUser(user: User?) {
        do {
            let userData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: "user")
            
            self.user = user
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func register(username: String, password: String, completion: @escaping(String, Int) -> ()) {
        let json: [String: Any] = ["username": username, "password": password]
        let postRequest = postRequest(endpoint: "/auth/register", json: json)
        let session = URLSession.shared
        session.dataTask(with: postRequest) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                let apiResponse = try? JSONDecoder().decode(Response.self, from: data)
                completion(apiResponse!.msg, response.statusCode)
            } else {
                completion(error!.localizedDescription, 404)
            }
        }.resume()
    }
    
    func login(username: String, password: String, completion: @escaping(String, Int) -> ()) {
        let json: [String: Any] = ["username": username, "password": password]
        let postRequest = postRequest(endpoint: "/auth/login", json: json)
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
                self.saveUser(user: user)
                completion("Login successfully", response.statusCode)
                
            } else {
                completion(error!.localizedDescription, 404)
            }
        }.resume()
    }
    
    func logout() {
        saveUser(user: nil)
    }
    
    func getUserSearchedWords() -> [String] {
        return user?.searchedWords ?? []
    }
    
    func getUserFavoriteWords() -> [String] {
        return user?.favoriteWords ?? []
    }
}
