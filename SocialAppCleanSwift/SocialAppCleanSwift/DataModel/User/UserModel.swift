//
//  UserModel.swift
//  CleanVIPTutorial
//
//  Created by Christian Slanzi on 24.11.20.
//

import SwiftyJSON

/*
 {
     "id": 1,
     "name": "Leanne Graham",
     "username": "Bret",
     "email": "Sincere@april.biz",
     "address": {
       "street": "Kulas Light",
       "suite": "Apt. 556",
       "city": "Gwenborough",
       "zipcode": "92998-3874",
       "geo": {
         "lat": "-37.3159",
         "lng": "81.1496"
       }
     },
     "phone": "1-770-736-8031 x56442",
     "website": "hildegard.org",
     "company": {
       "name": "Romaguera-Crona",
       "catchPhrase": "Multi-layered client-server neural-net",
       "bs": "harness real-time e-markets"
     }
   },
 */

struct UserModel: JSONinitiable {
    var id: String
    var name: String
    var username: String?
    var avatar: String?
    var email: String?
    var address: UserAddress?
    var phone: String?
    var website: String?
    var company: UserCompany?
    
    init(json: JSON) {
        self.id = json["id"].string ?? (json["id"].int != nil ? String(json["id"].int!): "")
        self.name = json["name"].string!
        self.username = json["username"].string
        self.avatar = json["avatar"].string
        self.email = json["email"].string
        self.phone = json["phone"].string
        self.website = json["website"].string
        
        if let value = json["address"].dictionaryObject {
            let new = UserAddress(json: JSON(value))
            self.address = new
        }
        
        if let value = json["company"].dictionaryObject {
            let new = UserCompany(json: JSON(value))
            self.company = new
        }
    }
    
    init(id: String,
         name: String,
         username: String?,
         avatar: String?,
         email: String?,
         address: UserAddress?,
         phone: String?,
         website: String?,
         company: UserCompany?) {
        self.id = id
        self.name = name
        self.username = username
        self.avatar = avatar
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
}

struct UserCompany {
    var name: String?
    var catchPhrase: String?
    var bs: String?
    
    init(json: JSON?) {
        self.name = json?["name"].string
        self.catchPhrase = json?["catchPhrase"].string
        self.bs = json?["bs"].string
    }
    
    init(name: String?,
         catchPhrase: String?,
         bs: String?) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}

struct UserAddress {
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: UserAddressGeo?
    
    init(json: JSON?) {
        self.street = json?["street"].string
        self.suite = json?["suite"].string
        self.city = json?["city"].string
        self.zipcode = json?["zipcode"].string
        
        if let value = json?["geo"].dictionaryObject {
            let new = UserAddressGeo(json: JSON(value))
            self.geo = new
        }
    }
    
    init(street: String?,
         suite: String?,
         city: String?,
         zipcode: String?,
         geo: UserAddressGeo?) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

struct UserAddressGeo {
    var lat: String
    var lng: String
    
    init(json: JSON?) {
        self.lat = json?["lat"].string ?? ""
        self.lng = json?["lng"].string ?? ""
    }
    
    init(lat: String,
         lng: String) {
        self.lat = lat
        self.lng = lng
    }
}
