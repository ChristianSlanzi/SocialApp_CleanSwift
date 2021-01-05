//
//  Post.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

/*
 {
     "userId": 1,
     "id": 1,
     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
   },
*/
import SwiftyJSON

struct Post: JSONinitiable {
    var userId: String
    var id: String
    var title: String
    var body: String
    var photo: String?
    var type: String // text, photo, ...
    var createdTime: Date
    var updatedTime: Date
    var likes: Int
    var comments: [Comment]
    
    init(json: JSON) {
        self.userId = json["userId"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.title = json["title"].string ?? ""
        self.body = json["body"].string ?? ""
        self.photo = json["photo"].string
        self.type = json["type"].string ?? "text"
        
        self.createdTime = json["created_time"].string?.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ", locale: Locale(identifier: "en_US_POSIX")) ?? Date()
        self.updatedTime = json["updated_time"].string?.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ", locale: Locale(identifier: "en_US_POSIX")) ?? Date()
        
        self.likes = json["likes"].int ?? 0
        
        self.comments = [Comment]()
        if let comments = json["comments"].array {
            for commentItem in comments {
                let new = Comment(json: JSON(commentItem))
                self.comments.append(new)
            }
        }
    }
    
    init(userId: String,
         id: String,
         title: String,
         body: String,
         photo: String?,
         type: String, // text, photo, ...
         createdTime: Date,
         updatedTime: Date,
         likes: Int,
         comments: [Comment]) {
        
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        self.photo = photo
        self.type = type
        
        self.createdTime = createdTime
        self.updatedTime = updatedTime
        
        self.likes = likes
        self.comments = comments
    }
}


