//
//  ThingsListPagingViewModel.swift
//  SampleApp
//
//  Created by Kate on 8/31/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

typealias NextPage = (after: String?, size: Int)

class ThingsListPagingViewModel: ThingsListViewModel {
    
    let loadingThreshold = 10
    
    var nextPage: NextPage = (nil, 25)
    var isLoadding: Bool = false
    
    override func loadPage() {
        
        if isLoadding  { return }
        
        isLoadding = true
        
        let parameters = nextPageRequestParameters(nextPage)
        
        self.service.executeRequest(.GET, .Top, parameters: parameters, success: { [weak self] (jsonDictionary) in
            
            guard let `self` = self else { return }
            
            self.nextPage.after = jsonDictionary["after"] as? String
            let children = jsonDictionary["children"] as! [Dictionary<String, Any>]
            let things = children.flatMap{ (dictionary: Dictionary<String, Any>) in
                return Thing.init(dictionary: dictionary["data"] as! Dictionary<String, Any>)
            }
            
            let newThings = things.map{ thing in return ThingViewModel.init(thing: thing, cache: self.imageCache) }
            
            self.things.append(contentsOf: newThings)
            
            DispatchQueue.main.async {
                self.didUpdate?(self)
                self.isLoadding = false
            }
            
        }) { [weak self] (error) in
            
            self?.isLoadding = false
        }
    }
    
    func loadPageIfNeed(forRow row: Int) {
        
        if row < things.count - loadingThreshold {return}
        
        loadPage()
    }
    
    private func nextPageRequestParameters(_ nextPage: NextPage) -> Dictionary<String, String> {
        
        var parameters = ["raw_json": "1",
                          "limit": String(nextPage.size)]
        
        if let after = nextPage.after {
            parameters["after"] = after
        }
        
        return parameters
    }
    
}
