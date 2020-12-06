//
//  Environment.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//

struct Environment {
    var networkingService: ApiServiceInterface = NetworkingService()
}

var Current = Environment(networkingService: NetworkingService())

extension Environment {
    static let mock = Environment(networkingService: NetworkingService.mock)
}

extension NetworkingService {
    static let mock = NetworkingServiceMock()
}
