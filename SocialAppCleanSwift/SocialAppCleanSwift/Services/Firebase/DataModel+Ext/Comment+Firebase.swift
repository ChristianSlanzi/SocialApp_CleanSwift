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
        
        //self.postId = documentData["postId"] as? String ?? ""
        self.id = documentData["id"] as? String ?? ""
        self.userId = documentData["userId"] as? String ?? ""
        //self.name = documentData["name"] as? String ?? ""
        //self.email = documentData["email"] as? String ?? ""
        self.body = documentData["body"] as? String ?? ""
        
        if let createdTime = documentData["creationTime"] as? Timestamp {
            self.createdTime = createdTime.dateValue()
        } else {
            self.createdTime = Date()
        }
        if let updatedTime = documentData["updateTime"] as? Timestamp {
            self.updatedTime = updatedTime.dateValue()
        } else {
            self.updatedTime = Date()
        }
    }
    
    init?(documentData: [String: Any]) {
        //guard let documentData = document.data() else { return nil }
        
        //self.postId = documentData["postId"] as? String ?? ""
        self.id = documentData["id"] as? String ?? ""
        self.userId = documentData["userId"] as? String ?? ""
        //self.name = documentData["name"] as? String ?? ""
        //self.email = documentData["email"] as? String ?? ""
        self.body = documentData["body"] as? String ?? ""
        
        if let createdTime = documentData["creationTime"] as? Timestamp {
            self.createdTime = createdTime.dateValue()
        } else {
            self.createdTime = Date()
        }
        if let updatedTime = documentData["updateTime"] as? Timestamp {
            self.updatedTime = updatedTime.dateValue()
        } else {
            self.updatedTime = Date()
        }
    }
}
