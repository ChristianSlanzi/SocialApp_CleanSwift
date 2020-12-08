//
//  SellItem.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//

import SwiftyJSON

struct SellItem: JSONinitiable {
    var identifier: String
    var title: String
    var description: String
    var imageUrl: String
    var price: String
    
    init(json: JSON) {
        self.identifier = json["id"].string ?? ""
        self.title = json["title"].string ?? ""
        self.description = json["descr"].string ?? ""
        self.imageUrl = json["img"].string ?? ""
        self.price = json["price"].string ?? ""
    }
}
