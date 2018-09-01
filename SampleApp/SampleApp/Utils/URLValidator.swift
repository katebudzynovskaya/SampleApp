//
//  URLValidator.swift
//  SampleApp
//
//  Created by Kate on 9/1/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

class URLValidator  {
    
    static func isURL(url: String) -> Bool {
        
        let regEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[regEx])
        return predicate.evaluate(with:url)
    }
}
