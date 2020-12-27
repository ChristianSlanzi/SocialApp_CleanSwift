//
//  Photo.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

struct Photo: JSONinitiable {
    var albumId: String
    var id: String
    var title: String
    var url: String
    var thumbnailUrl: String
    
    init(json: JSON) {
        self.albumId = json["albumId"].string ?? (json["albumId"].int != nil ? String(json["albumId"].int!): "")
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.title = json["title"].string ?? ""
        self.url = json["url"].string ?? ""
        self.thumbnailUrl = json["thumbnailUrl"].string ?? ""
    }
}
