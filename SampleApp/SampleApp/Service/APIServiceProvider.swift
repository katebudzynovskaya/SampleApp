//
//  APIServiceProvider.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

class APIServiceProvider: APIService {
    
    func executeRequest(url: String, parameters: Dictionary<String, String> = [:], success: @escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
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
