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
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(json: JSON) {
        self.userId = json["userId"].int ?? -1
        self.id = json["id"].int ?? -1
        self.title = json["title"].string ?? ""
        self.body = json["body"].string ?? ""
    }
}
