//
//  Comment+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 28.12.20.
//

import FirebaseFirestore

extension Comment: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        
        self.postId = documentData["postId"] as? String ?? ""
        self.id = documentData["id"] as? String ?? ""
        self.name = documentData["name"] as? String ?? ""
        self.email = documentData["email"] as? String ?? ""
        self.body = documentData["body"] as? String ?? ""
    }
}
