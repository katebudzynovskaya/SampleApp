//
//  ThingPreviewViewModel.swift
//  SampleApp
//
//  Created by Kate on 9/3/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

class ThingPreviewViewModel {
    
    var preview: LoadingImage?
    
    init(thing: Thing, cache: ImageCache) {
        
        if let sourceImage = thing.sourceImage {
            self.preview = LoadingImage(image: sourceImage, cache: cache)
        }
    }
}
