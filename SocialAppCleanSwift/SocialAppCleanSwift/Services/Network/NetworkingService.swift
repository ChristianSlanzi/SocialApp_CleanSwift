//
//  NetworkService.swift
//  CleanVIPTutorial
//
//  Created by Christian Slanzi on 24.11.20.
//

import Alamofire
import SwiftyJSON

class NetworkingService: ApiServiceInterface {
    func save(_ post: Post, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    
    private func retrieveItems<T: JSONinitiable>(url: String, completion: @escaping (Result<[T], Error>) -> Void) {
        AF.request(url).responseJSON { (response) in
            print(response)
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
    
    func retrieveComments(for postId: String, completion: @escaping (Result<[Comment], Error>) -> Void) {
        retrieveItems(url: "https://jsonplaceholder.typicode.com/posts/\(postId)/comments", completion: completion)
    }
    
    func retrieveAlbums(for userId: Int, completion: @escaping (Result<[Album], Error>) -> Void) {
        retrieveItems(url: "https://jsonplaceholder.typicode.com/users/\(userId)/albums/", completion: completion)
    }
    
    func retrievePhotos(for albumId: Int, completion: @escaping (Result<[Photo], Error>) -> Void) {
        retrieveItems(url: "https://jsonplaceholder.typicode.com/albums/\(albumId)/photos", completion: completion)
    }
    
    func retrievePosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        
        retrieveItems(url: "https://my-json-server.typicode.com/christianslanzi/SocialAppJson/posts", completion: completion)
    }
    
    func retrieveArticles(for userId: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        retrieveItems(url: "https://my-json-server.typicode.com/christianslanzi/SocialAppJson/articles", completion: completion)
    }
    
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {
        retrieveItems(url: "https://my-json-server.typicode.com/christianslanzi/SocialAppJson/users", completion: completion)
    }
}


