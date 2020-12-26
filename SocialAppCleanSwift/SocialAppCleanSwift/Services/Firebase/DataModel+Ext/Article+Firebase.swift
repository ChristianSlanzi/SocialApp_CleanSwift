//
//  Article+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.12.20.
//

import FirebaseFirestore

extension Article: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        
        self.date = documentData["date"] as? String ?? ""
        self.authors = documentData["authors"] as? String ?? ""
        self.title = documentData["title"] as? String ?? ""
        self.website = documentData["website"] as? String ?? ""
        self.content = documentData["content"] as? String ?? ""
        self.imageUrl = documentData["imageUrl"] as? String ?? ""
        
    }
}
