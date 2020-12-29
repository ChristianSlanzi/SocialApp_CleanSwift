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
    func retrieveStories(completion: @escaping (Result<[Story], Error>) -> Void) {
        
    }
    
    func update(_ todo: Todo, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    func save(_ todo: Todo, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    func save(_ post: Post, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    private func retrieveItems<T: JSONinitiable>(json: JSON, completion: @escaping (Result<[T], Error>) -> Void) {
        if let data = json.array {
            let items = data.map({ T(json: JSON($0.object)) })
            completion(.success(items))
            return
        }
        completion(.failure(NetworkServiceError.jsonWrongFormat))
    }
    
    func retrieveReminders(for userId: String, completion: @escaping (Result<[Reminder], Error>) -> Void) {
        //TODO
    }
    
    func retrieveTodos(for userId: String, completion: @escaping (Result<[Todo], Error>) -> Void) {
        retrieveItems(json: todosData, completion: completion)
    }
    
    func retrieveComments(for postId: String, completion: @escaping (Result<[Comment], Error>) -> Void) {
        retrieveItems(json: commentsPost1Data, completion: completion)
    }
    
    func retrieveAlbums(for userId: String, completion: @escaping (Result<[Album], Error>) -> Void) {
        retrieveItems(json: albumsData, completion: completion)
    }
    
    func retrievePhotos(for albumId: String, completion: @escaping (Result<[Photo], Error>) -> Void) {
        retrieveItems(json: photosData, completion: completion)
    }
    
    func retrievePosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        retrieveItems(json: postsData, completion: completion)
    }
    
    func retrieveArticles(for userId: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        retrieveItems(json: articlesData, completion: completion)
        //retrieveItems(json: articlesEmptyData, completion: completion)
    }
    
    func retrieveUsers(completion: @escaping (Result<[User], Error>)->Void) {
        retrieveItems(json: usersData, completion: completion)
    }
    
    func retrieveSellItems(for userId: String, completion: @escaping (Result<[SellItem], Error>) -> Void) {
        //TODO
    }
}
