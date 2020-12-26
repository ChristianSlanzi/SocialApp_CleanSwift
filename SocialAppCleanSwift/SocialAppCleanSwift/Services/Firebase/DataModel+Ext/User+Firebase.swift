//
//  User+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.12.20.
//

import FirebaseFirestore

extension User: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        
        self.id = documentData["id"] as? String  ?? ""
        self.name = documentData["name"] as? String  ?? ""
        self.username = documentData["username"] as? String  ?? ""
        self.avatar = documentData["avatar"] as? String? ?? nil
        self.email = documentData["email"] as? String  ?? ""
        self.phone = documentData["phone"] as? String  ?? ""
        self.website = documentData["website"] as? String  ?? ""
        
        if let value = documentData["address"] as? [String:Any] {
            let street = value["street"] as? String? ?? nil
            let suite = value["suite"] as? String? ?? nil
            let city = value["city"] as? String? ?? nil
            let zipcode = value["zipcode"] as? String? ?? nil
            
            self.address = UserAddress(street: street, suite: suite, city: city, zipcode: zipcode, geo: nil)
        }
    }
}
