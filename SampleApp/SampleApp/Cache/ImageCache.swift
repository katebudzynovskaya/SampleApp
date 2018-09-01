//
//  ImageCache.swift
//  SampleApp
//
//  Created by Kate on 9/1/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation
import UIKit

protocol ImageCache {
    
    func hasCachedImage(url: String) -> Bool
    func cachedImage(url: String, placeholder: UIImage) -> UIImage
    func image(url: String, success: @escaping (UIImage?) -> Void, failure: @escaping (Error) -> Void)
    func clearCache()
}
