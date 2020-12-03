//
//  Todo.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//

import SwiftyJSON

struct Todo: JSONinitiable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
    
    init(json: JSON) {
        self.userId = json["userId"].int ?? -1
        self.id = json["id"].int ?? -1
        self.title = json["title"].string ?? ""
        self.completed = json["completed"].bool ?? false
    }
}
