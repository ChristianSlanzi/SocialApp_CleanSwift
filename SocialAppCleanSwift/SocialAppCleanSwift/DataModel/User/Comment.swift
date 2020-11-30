//
//  Comment.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

struct Comment: JSONinitiable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
    
    init(json: JSON) {
        self.postId = json["postId"].int ?? -1
        self.id = json["id"].int ?? -1
        self.name = json["name"].string ?? ""
        self.email = json["email"].string ?? ""
        self.body = json["body"].string ?? ""
    }
}
