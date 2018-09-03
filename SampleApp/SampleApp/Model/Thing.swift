//
//  Thing.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation

class Thing {
    
    var id: String!
    var title: String!
    var author: String!
    var entryDate: Date!
    var commentsNumber: Int!
    
    var thumbnail: Thumbnail?
    var sourceImage: SourceImage?
    
    init?(dictionary: Dictionary<String, Any>) {
        
        guard let id = dictionary["id"] as? String,
            let title = dictionary["title"] as? String,
            let author = dictionary["author"] as? String,
            let entryTimestamp = dictionary["created_utc"] as? Double,
            let commentsNumber = dictionary["num_comments"] as? Int else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.author = author
        self.entryDate = Date(timeIntervalSince1970: entryTimestamp)
        self.commentsNumber = commentsNumber
        
        self.thumbnail = Thumbnail(dictionary: dictionary)
        self.sourceImage = SourceImage(dictionary: dictionary)
    }
}
