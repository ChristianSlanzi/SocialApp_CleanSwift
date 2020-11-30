//
//  Photo.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

struct Photo: JSONinitiable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    init(json: JSON) {
        self.albumId = json["albumId"].int ?? -1
        self.id = json["id"].int ?? -1
        self.title = json["title"].string ?? ""
        self.url = json["url"].string ?? ""
        self.thumbnailUrl = json["thumbnailUrl"].string ?? ""
    }
}
