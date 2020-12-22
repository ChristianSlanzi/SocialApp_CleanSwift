//
//  FirestoreService.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 21.12.20.
//

import FirebaseFirestore

class FirestoreService: ApiServiceInterface {
    
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {}
    func retrievePosts(completion: @escaping (Result<[Post], Error>)->Void) {
        fetch(completion: completion)
    }
    func retrieveComments(for postId: Int, completion: @escaping (Result<[Comment], Error>)->Void) {}
    func retrieveAlbums(for userId: Int, completion: @escaping (Result<[Album], Error>)->Void) {}
    func retrievePhotos(for albumId: Int, completion: @escaping (Result<[Photo], Error>)->Void) {}
    func retrieveTodos(for userId: Int, completion: @escaping (Result<[Todo], Error>)->Void) {}
    func retrieveArticles(for userId: Int, completion: @escaping (Result<[Article], Error>)->Void) {}
    
    private init() {}
    static let shared = FirestoreService()
    
    private let database = Firestore.firestore()
    private lazy var postTypesReference = database.collection("posts")
    
    func save(_ post: Post, completion: @escaping (Result<Bool, Error>) -> Void) {
        postTypesReference.addDocument(data: ["userId" :  post.userId,
                                              "id" : post.id,
                                              "title" : post.title,
                                              "body" : post.body,
                                              "photo" : post.photo ?? "",
                                              "type" : post.type,
                                              "createdTime": post.createdTime,
                                              "updatedTime": post.createdTime
        ]) { (error) in
            if let unwrappedError = error {
                completion(.failure(unwrappedError))
            } else {
                completion(.success(true))
            }
        }
    }
    
    func fetch(completion: @escaping (Result<[Post], Error>)->Void) {

        postTypesReference.getDocuments(completion: { (snapshot, error) in
            guard let unwrappedSnapshot = snapshot else { return }
            
            let documents = unwrappedSnapshot.documents
            
            var posts = [Post]()
            for document in documents {
                let documentData = document.data()
                
                guard let userId = documentData["userId"] as? Int,
                      let id = documentData["id"] as? Int,
                      let title = documentData["title"] as? String,
                      let body = documentData["body"] as? String,
                      let photo = documentData["photo"] as? String?,
                      let type = documentData["type"] as? String,
                      let createdTime = documentData["createdTime"] as? Timestamp,
                      let updatedTime = documentData["updatedTime"] as? Timestamp else {
                    continue
                }
                
                let post = Post(userId: userId, id: id, title: title, body: body, photo: photo, type: type, createdTime: createdTime.dateValue(), updatedTime: updatedTime.dateValue())
                posts.append(post)
                
            }
            
            completion(.success(posts))
        })
    }
    
    func listen(completion: @escaping (Result<[Post], Error>)->Void) {
        postTypesReference.addSnapshotListener { (snapshot, error) in
            guard let unwrappedSnapshot = snapshot else { return }
            
            let documents = unwrappedSnapshot.documents
            
            var posts = [Post]()
            for document in documents {
                let documentData = document.data()
                
                guard let userId = documentData["userId"] as? Int,
                      let id = documentData["id"] as? Int,
                      let title = documentData["title"] as? String,
                      let body = documentData["body"] as? String,
                      let photo = documentData["photo"] as? String?,
                      let type = documentData["type"] as? String,
                      let createdTime = documentData["createdTime"] as? Timestamp,
                      let updatedTime = documentData["updatedTime"] as? Timestamp else {
                    continue
                }
                
                let post = Post(userId: userId, id: id, title: title, body: body, photo: photo, type: type, createdTime: createdTime.dateValue(), updatedTime: updatedTime.dateValue())
                posts.append(post)
                
            }
            
            completion(.success(posts))
        }
    }
}
