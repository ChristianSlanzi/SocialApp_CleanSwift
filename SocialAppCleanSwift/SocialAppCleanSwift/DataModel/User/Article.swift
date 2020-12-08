//
//  Article.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//

import SwiftyJSON

struct Article: JSONinitiable {
    var date: String
    var title: String
    var website: String
    var authors: String
    var content: String
    var imageUrl: String
    
    init(json: JSON) {
        self.date = json["date"].string ?? ""
        self.authors = json["authors"].string ?? ""
        self.title = json["title"].string ?? ""
        self.website = json["website"].string ?? ""
        self.content = json["content"].string ?? ""
        self.imageUrl = json["imageUrl"].string ?? ""
    }
}
