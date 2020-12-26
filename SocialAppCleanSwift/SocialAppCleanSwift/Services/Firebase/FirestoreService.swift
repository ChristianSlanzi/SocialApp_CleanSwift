//
//  FirestoreService.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 21.12.20.
//

import FirebaseFirestore

class FirestoreService: ApiServiceInterface {
    
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {
        fetchUsers(completion: completion)
    }
    func retrievePosts(completion: @escaping (Result<[Post], Error>)->Void) {
        fetch(completion: completion)
    }
    func retrieveComments(for postId: String, completion: @escaping (Result<[Comment], Error>)->Void) {}
    func retrieveAlbums(for userId: Int, completion: @escaping (Result<[Album], Error>)->Void) {}
    func retrievePhotos(for albumId: Int, completion: @escaping (Result<[Photo], Error>)->Void) {}
    func retrieveTodos(for userId: Int, completion: @escaping (Result<[Todo], Error>)->Void) {}
    func retrieveArticles(for userId: String, completion: @escaping (Result<[Article], Error>)->Void) {
        fetchCollection(collection: "articles", completion: completion)
    }
    
    private init() {}
    static let shared = FirestoreService()
    
    private let database = Firestore.firestore()
    private lazy var postTypesReference = database.collection("posts")
    private lazy var userTypesReference = database.collection("users")
    private lazy var articlesTypesReference = database.collection("articles")
    
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
    
    func fetchCollection<T: DocumentProtocol>(collection: String, completion: @escaping (Result<[T], Error>)->Void) {
        var array: [T] = []
        database.collection(collection).getDocuments() { (querySnapshot, err) in
            if let snapshot = querySnapshot {
                //guard let userID = Auth.auth().currentUser?.uid else { return }
                for document in snapshot.documents {
                    if let item: T = T.init(document: document) {
                        array.append(item)
                    }
                }
                completion(.success(array))
            }
        }
    }
    
    func fetchUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {

        userTypesReference.getDocuments(completion: { (snapshot, error) in
            guard let unwrappedSnapshot = snapshot else { return }
            
            let documents = unwrappedSnapshot.documents
            
            var users = [UserModel]()
            for document in documents {
                let documentData = document.data()
                
                guard let name = documentData["name"] as? String,
                      let id = documentData["id"] as? String,
                      let username = documentData["username"] as? String?,
                      let avatar = documentData["avatar"] as? String?,
                      let email = documentData["email"] as? String?,
                      //let address = documentData["address"] as? String,
                      let phone = documentData["phone"] as? String?,
                      let website = documentData["website"] as? String?//,
                      //let company = documentData["company"] as? String
                else {
                    continue
                }
                
                let addressObject = UserAddress(street: "pinco street", suite: nil, city: nil, zipcode: nil, geo: nil)
                let companyObject = UserCompany(name: "FarmaTek", catchPhrase: nil, bs: nil)
                
                let user = UserModel(id: id, name: name, username: username, avatar: avatar, email: email, address: addressObject, phone: phone, website: website, company: companyObject)
                users.append(user)
                
            }
            
            completion(.success(users))
        })
    }
    
    func fetch(completion: @escaping (Result<[Post], Error>)->Void) {

        postTypesReference.getDocuments(completion: { (snapshot, error) in
            guard let unwrappedSnapshot = snapshot else { return }
            
            let documents = unwrappedSnapshot.documents
            
            var posts = [Post]()
            for document in documents {
                let documentData = document.data()
                
                guard let userId = documentData["userId"] as? Int,
                      let id = documentData["id"] as? String,
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
                      let id = documentData["id"] as? String,
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
