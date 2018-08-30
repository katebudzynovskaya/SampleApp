//
//  ThingsListViewModel.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

class ThingsListViewModel {
    
    var things = [ThingViewModel]()
    var service: APIService
    var didUpdate: ((ThingsListViewModel) -> Void)?
    
    init(service: APIService) {
        
        self.service = service
    }
    
    func load() {
        
        self.service.executeRequest(.GET, .Top, parameters: ["raw_json": "1"], success: { [weak self] (jsonDictionary) in
            
            guard let `self` = self else { return }
            
            let children = jsonDictionary["children"] as! [Dictionary<String, Any>]
            let things = children.flatMap{ (dictionary: Dictionary<String, Any>) in
                return Thing.init(dictionary: dictionary["data"] as! Dictionary<String, Any>)
            }
            
            self.things = things.map{ thing in return ThingViewModel.init(thing: thing)}
            
            DispatchQueue.main.async {
                self.didUpdate?(self)
            }
            
        }) { (error) in
            // TODO: hanlde error
        }
        
    }
}
