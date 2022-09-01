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
    
    func register(username: String, password: String, completion: @escaping(String, Int) -> ()) {
        let url = URL(string: api + "/auth/register")!
        var request = URLRequest(url: url)
        
        let json: [String: Any] = ["username": username, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        print(request)
        
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
}
