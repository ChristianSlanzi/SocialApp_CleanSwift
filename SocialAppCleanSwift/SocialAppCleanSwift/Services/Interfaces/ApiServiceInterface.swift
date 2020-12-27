//
//  ApiServiceInterface.swift
//  CleanVIPTutorial
//
//  Created by Christian Slanzi on 25.11.20.
//

protocol ApiServiceInterface: ServiceInterface {
    func retrieveUsers(completion: @escaping (Result<[User], Error>)->Void)
    func retrievePosts(completion: @escaping (Result<[Post], Error>)->Void)
    func retrieveComments(for postId: String, completion: @escaping (Result<[Comment], Error>)->Void)
    func retrieveAlbums(for userId: String, completion: @escaping (Result<[Album], Error>)->Void)
    func retrievePhotos(for albumId: String, completion: @escaping (Result<[Photo], Error>)->Void)
    func retrieveTodos(for userId: Int, completion: @escaping (Result<[Todo], Error>)->Void)
    func retrieveArticles(for userId: String, completion: @escaping (Result<[Article], Error>)->Void)
    
    func save(_ post: Post, completion: @escaping (Result<Bool, Error>) -> Void)
}
