//
//  ThingViewModel.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

class ThingViewModel {
    
    var id: String
    var title: String
    var author: String
    var entryDate: String
    var commentsNumber: String
    let thing: Thing
    
    var thumbnail: LoadingImage?
    
    init(thing: Thing, cache: ImageCache) {
        
        self.thing = thing
        self.id = thing.id
        self.title = thing.title
        self.author = thing.author
        self.entryDate = thing.entryDate.timeAgo()
        self.commentsNumber = thing.commentsNumber.shortendFormat()
        
        if let thumbnail = thing.thumbnail {
            self.thumbnail = LoadingImage(image: thumbnail, cache: cache)
        }
    }
    
    func reset() {
        
        self.thumbnail?.didDownload = nil
        self.thumbnail?.state = .ready
    }
}
