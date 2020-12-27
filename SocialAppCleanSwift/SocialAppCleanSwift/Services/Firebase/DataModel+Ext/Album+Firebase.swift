//
//  Album+Firebase.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.12.20.
//

import FirebaseFirestore

extension Album: DocumentProtocol {
    init?(document: DocumentSnapshot) {
        guard let documentData = document.data() else { return nil }
        

        self.id = documentData["id"] as? String ?? ""
        self.title = documentData["title"] as? String ?? ""
        self.userId = documentData["userId"] as? String ?? ""
    }
}
