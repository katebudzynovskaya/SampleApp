//
//  Image.swift
//  SampleApp
//
//  Created by Kate on 9/1/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation
import CoreGraphics

protocol Image {
    
    var url: String! {get}
    var originalSize: CGSize {get}

    init!(dictionary: Dictionary<String, Any>)
}

class Thumbnail: Image {
    
    var url: String!
    var originalSize: CGSize = CGSize(width: 0.0, height: 0.0)
    
    required init!(dictionary: Dictionary<String, Any>) {
        
        guard let url = dictionary["thumbnail"] as? String,
            let width = dictionary["thumbnail_width"] as? Double,
            let height = dictionary["thumbnail_height"] as? Double
            else { return nil }
        
        guard URLValidator.isURL(url: url)
            else { return nil }
        
        self.url = url
        self.originalSize = CGSize(width: width, height: height)
    }
}
