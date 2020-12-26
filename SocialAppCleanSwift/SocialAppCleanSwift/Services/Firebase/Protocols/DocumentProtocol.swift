//
//  PackageProtocol.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.12.20.
//

import FirebaseFirestore

protocol DocumentProtocol {
    init?(document: DocumentSnapshot)
}
