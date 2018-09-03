//
//  SourceImage.swift
//  SampleApp
//
//  Created by Kate on 9/2/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation
import CoreGraphics

class SourceImage: Image {
    
    var url: String!
    var originalSize: CGSize = CGSize(width: 0.0, height: 0.0)
    
    required init!(dictionary: Dictionary<String, Any>) {
        
        guard let preview = dictionary["preview"] as? Dictionary<String, Any>,
            let images = preview["images"] as? Array<Dictionary<String, Any>>,
            let source = images[0]["source"] as? Dictionary<String, Any>
        else { return nil }
        
        guard let url = source["url"] as? String,
            let width = source["width"] as? Double,
            let height = source["height"] as? Double
        else { return nil }
        
        self.url = url
        self.originalSize = CGSize(width: width, height: height)
    }
}
