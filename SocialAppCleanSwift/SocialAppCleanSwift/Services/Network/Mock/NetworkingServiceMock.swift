//
//  NetworkingServiceMock.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

enum NetworkServiceError: Error {
    case jsonWrongFormat
}

class NetworkingServiceMock: ApiServiceInterface {
    
    private func retrieveItems<T: JSONinitiable>(json: JSON, completion: @escaping (Result<[T], Error>) -> Void) {
        if let data = json.array {
            let items = data.map({ T(json: JSON($0.object)) })
            completion(.success(items))
            return
        }
        completion(.failure(NetworkServiceError.jsonWrongFormat))
    }
    
    func retrieveTodos(for userId: Int, completion: @escaping (Result<[Todo], Error>) -> Void) {
        retrieveItems(json: todosData, completion: completion)
    }
    
    func retrieveComments(for postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        retrieveItems(json: commentsPost1Data, completion: completion)
    }
    
    func retrieveAlbums(for userId: Int, completion: @escaping (Result<[Album], Error>) -> Void) {
        retrieveItems(json: albumsData, completion: completion)
    }
    
    func retrievePhotos(for albumId: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
        retrieveItems(json: photosData, completion: completion)
    }
    
    func retrievePosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        retrieveItems(json: postsData, completion: completion)
    }
    
    func retrieveArticles(for userId: Int, completion: @escaping (Result<[Article], Error>) -> Void) {
        retrieveItems(json: articlesData, completion: completion)
        //retrieveItems(json: articlesEmptyData, completion: completion)
    }
    
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {
        retrieveItems(json: usersData, completion: completion)
    }
}
