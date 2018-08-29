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
    
    init(thing: Thing) {
        
        self.id = thing.id
        self.title = thing.title
        self.author = thing.author
        self.entryDate = "yesterday" // TODO: convert to 'X ago' format
        self.commentsNumber = "\(thing.commentsNumber)"
    }
}
