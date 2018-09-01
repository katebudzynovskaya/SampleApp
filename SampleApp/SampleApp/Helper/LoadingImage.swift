//
//  LoadingImage.swift
//  SampleApp
//
//  Created by Kate on 9/1/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation
import UIKit

class LoadingImage {
    
    enum State {
        case ready
        case cached
        case downloading
        case failed
    }
    
    var model: Image
    var cache: ImageCache
    var state: State = .ready
    
    var didDownload: ((UIImage) -> Void)?
    
    var image: UIImage {
    
        let logo = UIImage(named: "logo")
        let placeholder = UIImage.placeholder(size: self.model.originalSize, color: UIColor.lightGray, logo: logo)
        return self.cache.cachedImage(url: self.model.url, placeholder: placeholder)
    }
    
    init(image: Image, cache: ImageCache) {
        
        self.model = image
        self.cache = cache
        
        if cache.hasCachedImage(url: model.url) { state = .cached }
    }
    
    func startDownloading() {
        
        if state == .cached {
            didDownload?(image)
        }
        else {
            
            self.state = .downloading
            cache.image(url: model.url, success: { [weak self] (image) in
                
                guard let strongSelf = self else { return }
                
                if let image = image {
                    strongSelf.state = .cached
                    strongSelf.didDownload?(image)
                }
                else {
                    strongSelf.state = .failed
                }
                
            }, failure: { [weak self] (error) in
                
                guard let strongSelf = self else { return }
                strongSelf.state = .failed
            })
        }
    }
}
