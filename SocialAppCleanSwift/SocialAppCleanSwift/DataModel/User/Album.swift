//
//  Album.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

struct Album: JSONinitiable {
    var userId: Int
    var id: Int
    var title: String
    
    init(json: JSON) {
        self.userId = json["userId"].int ?? -1
        self.id = json["id"].int ?? -1
        self.title = json["title"].string ?? ""
    }
}
