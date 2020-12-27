//
//  Todo.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//

import SwiftyJSON

struct Todo: JSONinitiable {
    var userId: String
    var id: String
    var title: String
    var completed: Bool
    
    init(json: JSON) {
        self.userId = json["userId"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.title = json["title"].string ?? ""
        self.completed = json["completed"].bool ?? false
    }
}
