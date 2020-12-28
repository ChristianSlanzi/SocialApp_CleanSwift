//
//  Reminder.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 28.12.20.
//

import SwiftyJSON

struct Reminder: JSONinitiable {
    var userId: String
    var id: String
    var title: String
    var date: Date
    
    init(json: JSON) {
        self.userId = json["userId"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.title = json["title"].string ?? ""
        self.date = json["date"].string?.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ", locale: Locale(identifier: "en_US_POSIX")) ?? Date.distantPast
        
    }
}
