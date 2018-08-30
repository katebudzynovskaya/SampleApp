//
//  APIServiceProvider.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

class APIServiceProvider: APIService {
    
    let session = URLSession.shared
    
    func executeRequest(_ method: HTTPMethod, _ endpoint: Endpoint, parameters: Dictionary<String, String> = [:], success: @escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error) -> Void)
    {
        switch method {
        case .GET:
            executeGET(endpoint, parameters: parameters, success: success, failure: failure)
        default:
            fatalError()
        }
    }
    
    private func executeGET(_ endpoint: Endpoint, parameters: Dictionary<String, String> = [:], success: @escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error) -> Void)
    {
        guard let url = URLBuilder.url(host: "www.reddit.com", endpoint: Endpoint.Top.rawValue, parameters: parameters) else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                failure(error)
            }
            
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data) {
                
                let rootDictionary = json as! Dictionary<String, Any>
                let jsonDictionary = rootDictionary["data"] as! Dictionary<String, Any>
                
                success(jsonDictionary)
                
            } else {
                // TODO: handle error
            }
            
            
            }.resume()
    }

}
