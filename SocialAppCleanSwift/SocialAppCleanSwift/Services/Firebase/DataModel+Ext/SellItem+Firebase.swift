//
//  SellItem+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 28.12.20.
//

import FirebaseFirestore

extension SellItem: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        
        self.id = documentData["id"] as? String ?? ""
        self.title = documentData["title"] as? String ?? ""
        self.description = documentData["description"] as? String ?? ""
        self.price = documentData["price"] as? String ?? ""
        self.imageUrl = documentData["imageUrl"] as? String ?? ""
        
    }
}
