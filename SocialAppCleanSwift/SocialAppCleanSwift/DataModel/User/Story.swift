//
//  Story.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//

import SwiftyJSON

struct Story: JSONinitiable {
    var userId: String
    var id: String
    var title: String
    var pages: [String] //an array of images urls for now
    var type: String // text, photo, ...
    var createdTime: Date
    var updatedTime: Date
    
    init(json: JSON) {
        self.userId = json["userId"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.title = json["title"].string ?? ""
        self.pages = [String]()
        if let pages = json["pages"].array {
            for pageItem in pages {
                if let photo = pageItem["photo"].string {
                    self.pages.append(photo)
                }
            }
        }
        
        self.type = json["type"].string ?? "text"
        
        self.createdTime = json["created_time"].string?.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ", locale: Locale(identifier: "en_US_POSIX")) ?? Date()
        self.updatedTime = json["updated_time"].string?.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ", locale: Locale(identifier: "en_US_POSIX")) ?? Date()
    }
}
