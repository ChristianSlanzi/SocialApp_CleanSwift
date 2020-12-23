//
//  Environment.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//

struct Environment {
    var networkingService: ApiServiceInterface = NetworkingService()
    var storageService: StorageServiceInterface = StorageService.shared
}

var Current = Environment.firebase

extension Environment {
    static let githubDB = Environment()
    static let mock = Environment(networkingService: NetworkingService.mock)
    static let firebase = Environment(networkingService: NetworkingService.firebase)
}

extension NetworkingService {
    static let mock = NetworkingServiceMock()
    static let firebase = FirestoreService.shared
}
