//
//  Reminder+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 28.12.20.
//

import FirebaseFirestore

extension Reminder: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        
        self.userId = documentData["userId"] as? String ?? ""
        self.id = documentData["id"] as? String ?? ""
        self.title = documentData["title"] as? String ?? ""
        if let date = documentData["date"] as? Timestamp {
            self.date = date.dateValue()
        } else {
            self.date = Date.distantPast
        }
    }
}
