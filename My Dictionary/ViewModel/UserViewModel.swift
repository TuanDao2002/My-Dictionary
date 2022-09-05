//
//  UserViewModel.swift
//  My Dictionary
//
//  Created by Tuan Dao on 30/08/2022.
//

import Foundation

let api = "https://cosc2659dictionary.herokuapp.com/api"

final class UserViewModel: ObservableObject {
    @Published var user: User?
    static let obj = UserViewModel()
    
    private init() {
        self.user = getUser()
    }
    
    // get the current user
    func getUser() -> User?{
        if let userData = UserDefaults.standard.data(forKey: "user") {
            do {
                return try JSONDecoder().decode(User.self, from: userData)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }
    
    // save user in UserDefault
    func saveUser(user: User?) {
        if (user == nil) {
            UserDefaults.standard.set(nil, forKey: "user")
            return
        }
        do {
            let userData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: "user")
            
//            self.user = user
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // register new account
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
    
    // login to an account
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
    
    // logout of an account
    func logout() {
        saveUser(user: nil)
    }
    
    // get list of searched words of the user
    func getUserSearchedWords() -> [String] {
        return getUser()?.searchedWords ?? []
    }
    
    // get list of favorite words of the user
    func getUserFavoriteWords() -> [String] {
        return getUser()?.favoriteWords ?? []
    }
    
    //Check for user login
    func isLogin() -> Bool {
        let check = getUser() != nil
        return check
    }
}
