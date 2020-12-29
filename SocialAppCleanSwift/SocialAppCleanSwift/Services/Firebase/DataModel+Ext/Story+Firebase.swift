//
//  Story+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//

import FirebaseFirestore

extension Story: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        
        self.userId = documentData["userId"] as? String  ?? ""
        self.id = documentData["id"] as? String  ?? ""
        self.title = documentData["title"] as? String  ?? ""
        self.pages = documentData["pages"] as? [String] ?? [String]()
        self.type = documentData["type"] as? String  ?? ""
        if let createdTime = documentData["createdTime"] as? Timestamp {
            self.createdTime = createdTime.dateValue()
        } else {
            self.createdTime = Date()
        }
        if let updatedTime = documentData["updatedTime"] as? Timestamp {
            self.updatedTime = updatedTime.dateValue()
        } else {
            self.updatedTime = Date()
        }
    }
}
