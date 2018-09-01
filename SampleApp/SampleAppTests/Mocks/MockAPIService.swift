//
//  MockAPIService.swift
//  SampleAppTests
//
//  Created by Kate on 9/1/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation
import UIKit

@testable import SampleApp

enum MockImageURL : String {
    case valid = "donwloaded_mock"
}

class MockAPIService: APIService {

    func executeRequest(_ method: HTTPMethod, _ endpoint: Endpoint, parameters: Dictionary<String, String>, success: @escaping (Dictionary<String, Any>) -> Void, failure: @escaping (Error) -> Void) {
        return }
    
    func executeRequest(url: String, success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        
        let mockUrl: MockImageURL! = MockImageURL(rawValue: url)
        
        switch mockUrl {
        case .valid:
            let bundle = Bundle(for: type(of: self))
            let image: UIImage! = UIImage(named: mockUrl.rawValue, in: bundle, compatibleWith: nil)
            let data: Data! = UIImagePNGRepresentation(image)
            success(data)

        default:
            fatalError()
        }
    }
}
