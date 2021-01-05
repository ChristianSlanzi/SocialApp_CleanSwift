//
//  Comment.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

struct Comment: JSONinitiable {
    //var postId: String
    var id: String
    var userId: String
    //var name: String
    //var email: String
    var body: String
    var createdTime: Date
    var updatedTime: Date
    
    init(json: JSON) {
        //self.postId = json["postId"].string ?? (json["postId"].int != nil ? String(json["postId"].int!): "")
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.userId = json["userId"].string ?? (json["userId"].int != nil ? String(json["userId"].int!): "")
        //self.name = json["name"].string ?? ""
        //self.email = json["email"].string ?? ""
        self.body = json["body"].string ?? ""
        
        self.createdTime = json["created_time"].string?.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ", locale: Locale(identifier: "en_US_POSIX")) ?? Date()
        self.updatedTime = json["updated_time"].string?.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ", locale: Locale(identifier: "en_US_POSIX")) ?? Date()
    }
}
