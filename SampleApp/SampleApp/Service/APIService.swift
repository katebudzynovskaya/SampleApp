//
//  APIService.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case GET
}

enum Endpoint : String {
    case Top = "/top.json"
}

enum APIError : Error {
    case ResponseError(String)
    case SerializationError(String)
}

protocol APIService {
    
    func executeRequest(_ method: HTTPMethod, _ endpoint: Endpoint, parameters: Dictionary<String, String>, success: @escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error) -> Void)
    
    func executeRequest(url: String, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) 
}
