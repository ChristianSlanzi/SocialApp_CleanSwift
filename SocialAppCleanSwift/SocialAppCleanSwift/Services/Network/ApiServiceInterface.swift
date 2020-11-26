//
//  ApiServiceInterface.swift
//  CleanVIPTutorial
//
//  Created by Christian Slanzi on 25.11.20.
//

protocol ApiServiceInterface: ServiceInterface {
    static func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void)
}
