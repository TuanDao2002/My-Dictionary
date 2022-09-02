//
//  PostRequest.swift
//  My Dictionary
//
//  Created by Tuan Dao on 02/09/2022.
//

import Foundation

func postRequest(endpoint: String, json: [String: Any]) -> URLRequest {
    let url = URL(string: api + endpoint)!
    var request = URLRequest(url: url)
    
    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = jsonData
     
    return request
}
