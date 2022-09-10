//
//  GetRequest.swift
//  My Dictionary
//
//  Created by Tuan Dao on 03/09/2022.
//

import Foundation

func getRequest(endpoint: String) -> URLRequest? {
    
    let url = URL(string: api + endpoint) ?? nil
    
    if (url == nil) {
        return nil
    }
    
    var request = URLRequest(url: url!)
    request.httpMethod = "GET"
    return request
}
