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


