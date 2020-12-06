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
        self.authors = json["id"].string ?? ""
        self.title = json["title"].string ?? ""
        self.website = json["completed"].string ?? ""
        self.content = json["title"].string ?? ""
        self.imageUrl = json["completed"].string ?? ""
    }
}
