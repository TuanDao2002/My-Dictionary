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
    
    func saveUser(user: User?) {
        if (user == nil) {
            return
        }
        do {
            let userData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(userData, forKey: "user")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func register(username: String, password: String, completion: @escaping(String, Int) -> ()) {
        let url = URL(string: api + "/auth/register")!
        var request = URLRequest(url: url)
        
        let json: [String: Any] = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
                
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                let apiResponse = try? JSONDecoder().decode(Response.self, from: data)
                completion(apiResponse!.msg, response.statusCode)
            } else {
                completion(error!.localizedDescription, 404)
            }
        }.resume()
    }
    
    func login(username: String, password: String, completion: @escaping(String, Int, User?) -> ()) {
        let url = URL(string: api + "/auth/login")!
        var request = URLRequest(url: url)
        
        let json: [String: Any] = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
                
        var user: User?
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data, let response = response as? HTTPURLResponse {
                
                if (response.statusCode != 200) {
                    let apiResponse = try? JSONDecoder().decode(Response.self, from: data)
                    completion(apiResponse!.msg, response.statusCode, nil)
                    return
                }
                
                user = try? JSONDecoder().decode(User.self, from: data)
                completion("Login successfully", response.statusCode, user)
                
            } else {
                completion(error!.localizedDescription, 404, nil)
            }
        }.resume()
        
        saveUser(user: user)
    }
}
