//
//  Photo+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.12.20.
//

import FirebaseFirestore

extension Photo: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        
        self.albumId = documentData["date"] as? String ?? ""
        self.id = documentData["authors"] as? String ?? ""
        self.title = documentData["title"] as? String ?? ""
        self.url = documentData["website"] as? String ?? ""
        self.thumbnailUrl = documentData["content"] as? String ?? ""
    }
}
