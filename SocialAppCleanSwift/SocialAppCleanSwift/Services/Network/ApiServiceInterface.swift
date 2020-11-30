//
//  ApiServiceInterface.swift
//  CleanVIPTutorial
//
//  Created by Christian Slanzi on 25.11.20.
//

protocol ApiServiceInterface: ServiceInterface {
    static func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void)
    static func retrievePosts(completion: @escaping (Result<[Post], Error>)->Void)
    static func retrieveComments(for postId: String, completion: @escaping (Result<[Comment], Error>)->Void)
    static func retrieveAlbums(completion: @escaping (Result<[Album], Error>)->Void)
    static func retrievePhotos(completion: @escaping (Result<[Photo], Error>)->Void)
}
