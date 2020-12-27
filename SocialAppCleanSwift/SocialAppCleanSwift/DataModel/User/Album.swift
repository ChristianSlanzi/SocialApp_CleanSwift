//
//  Album.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

struct Album: JSONinitiable {
    var userId: String
    var id: String
    var title: String
    
    init(json: JSON) {
        self.userId = json["userId"].string ?? (json["userId"].int != nil ? String(json["userId"].int!): "")
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.title = json["title"].string ?? ""
    }
}
