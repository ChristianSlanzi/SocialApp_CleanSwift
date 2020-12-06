//
//  NetworkService.swift
//  CleanVIPTutorial
//
//  Created by Christian Slanzi on 24.11.20.
//

import Alamofire
import SwiftyJSON

class NetworkingService: ApiServiceInterface {
    
    private func retrieveItems<T: JSONinitiable>(url: String, completion: @escaping (Result<[T], Error>) -> Void) {
        AF.request(url).responseJSON { (response) in
            switch(response.result) {
            case .success(let value):
                let data = JSON(value)
                if let item = data.array {
                    let posts = item.map({ T(json: JSON($0.object)) })
                    completion(.success(posts))
                    return
                }
                completion(.success([]))
                //print(data)
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func retrieveTodos(for userId: Int, completion: @escaping (Result<[Todo], Error>) -> Void) {
        retrieveItems(url: "https://jsonplaceholder.typicode.com/users/\(userId)/todos/", completion: completion)
    }
    
    func retrieveComments(for postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        retrieveItems(url: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments", completion: completion)
    }
    
    func retrieveAlbums(for userId: Int, completion: @escaping (Result<[Album], Error>) -> Void) {
        retrieveItems(url: "https://jsonplaceholder.typicode.com/users/\(userId)/albums/", completion: completion)
    }
    
    func retrievePhotos(for albumId: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
        retrieveItems(url: "https://jsonplaceholder.typicode.com/albums/\(albumId)/photos", completion: completion)
    }
    
    func retrievePosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        
        retrieveItems(url: "https://jsonplaceholder.typicode.com/posts", completion: completion)
        /*
        AF.request("https://jsonplaceholder.typicode.com/users").responseJSON { (response) in
            switch(response.result) {
            case .success(let value):
                let data = JSON(value)
                if let item = data.array {
                    let posts = item.map({ Post(json: JSON($0.object)) })
                    completion(.success(posts))
                    return
                }
                completion(.success([]))
                //print(data)
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }*/
    }
    
    func retrieveArticles(for userId: Int, completion: @escaping (Result<[Article], Error>) -> Void) {
        // TODO
    }
    
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {
        retrieveItems(url: "https://jsonplaceholder.typicode.com/users", completion: completion)
        /*
        AF.request("https://jsonplaceholder.typicode.com/users").responseJSON { (response) in
            switch(response.result) {
            case .success(let value):
                let data = JSON(value)
                if let item = data.array {
                    let users = item.map({ UserModel(json: JSON($0.object)) })
                    completion(.success(users))
                    return
                }
                completion(.success([]))
                //print(data)
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        */
    }
}


