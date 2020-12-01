//
//  ApiServiceInterface.swift
//  CleanVIPTutorial
//
//  Created by Christian Slanzi on 25.11.20.
//

protocol ApiServiceInterface: ServiceInterface {
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void)
    func retrievePosts(completion: @escaping (Result<[Post], Error>)->Void)
    func retrieveComments(for postId: String, completion: @escaping (Result<[Comment], Error>)->Void)
    func retrieveAlbums(completion: @escaping (Result<[Album], Error>)->Void)
    func retrievePhotos(completion: @escaping (Result<[Photo], Error>)->Void)
}
