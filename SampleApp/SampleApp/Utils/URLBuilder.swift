//
//  URLBuilder.swift
//  SampleApp
//
//  Created by Kate on 8/30/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

class URLBuilder {
    
    static let scheme = "https"
    
    static func url(host: String, endpoint: String? = nil, parameters: Dictionary<String, String> = [:]) -> URL? {
        
        var components = URLComponents()
        
        components.scheme = scheme
        components.host = host
        
        if let endpoint = endpoint {
            components.path = endpoint
        }
        
        if parameters.keys.count > 0 {
            components.queryItems = parameters.map{ URLQueryItem.init(name: $0, value: $1) }
        }
        
        return components.url
    }
}
