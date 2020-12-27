//
//  Todo+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 27.12.20.
//

import FirebaseFirestore

extension Todo: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        
        self.userId = documentData["userId"] as? String ?? ""
        self.id = documentData["id"] as? String ?? ""
        self.title = documentData["title"] as? String ?? ""
        self.completed = documentData["completed"] as? Bool ?? false
        
    }
}
