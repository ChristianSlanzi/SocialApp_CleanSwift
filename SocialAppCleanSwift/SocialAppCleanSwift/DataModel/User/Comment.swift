//
//  Comment.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

struct Comment: JSONinitiable {
    var postId: String
    var id: String
    var name: String
    var email: String
    var body: String
    
    init(json: JSON) {
        self.postId = json["postId"].string ?? (json["postId"].int != nil ? String(json["postId"].int!): "")
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.name = json["name"].string ?? ""
        self.email = json["email"].string ?? ""
        self.body = json["body"].string ?? ""
    }
}
