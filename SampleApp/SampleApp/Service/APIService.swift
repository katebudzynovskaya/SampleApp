//
//  APIService.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

protocol APIService {
    
    func executeRequest(url: String, parameters: Dictionary<String, String>, success: @escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error) -> Void)
    
}
