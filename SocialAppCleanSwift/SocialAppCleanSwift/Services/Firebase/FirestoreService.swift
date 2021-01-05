//
//  FirestoreService.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 21.12.20.
//

import FirebaseFirestore

class FirestoreService: ApiServiceInterface {
    func retrieveUser(for userId: String, completion: @escaping (Result<User, Error>) -> Void) {
        database.collection("users").whereField("id", isEqualTo: userId).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else if querySnapshot!.documents.count != 1 {
                // Perhaps this is an error for you?
                print("Too many documents? \(querySnapshot!.documents.count)")
            } else {
                let document = querySnapshot!.documents.first!
                if let user: User = User.init(document: document) {
                    completion(.success(user))
                }
            }
        }
    }
    
    
    func save(_ todo: Todo, completion: @escaping (Result<Bool, Error>) -> Void) {
        
    }
    
    func update(_ todo: Todo, completion: @escaping (Result<Bool, Error>) -> Void) {
        database.collection("todos").whereField("id", isEqualTo: todo.id).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else if querySnapshot!.documents.count != 1 {
                // Perhaps this is an error for you?
            } else {
                let document = querySnapshot!.documents.first!
                document.reference.updateData([
                    "title": todo.title,
                    "completed": todo.completed
                ])
            }
        }
    }
    
    func retrieveReminders(for userId: String, completion: @escaping (Result<[Reminder], Error>) -> Void) {
        fetchCollection(collection: "reminders", completion: completion)
    }
    func retrieveSellItems(for userId: String, completion: @escaping (Result<[SellItem], Error>) -> Void) {
        fetchCollection(collection: "sellItems", completion: completion)
    }
    func retrieveUsers(completion: @escaping (Result<[User], Error>)->Void) {
        //fetchUsers(completion: completion)
        fetchCollection(collection: "users", completion: completion)
    }
    func retrievePosts(completion: @escaping (Result<[Post], Error>)->Void) {
        //fetch(completion: completion)
        fetchCollection(collection: "posts", completion: completion)
    }
    func retrieveComments(for postId: String, completion: @escaping (Result<[Comment], Error>)->Void) {
        fetchCollection(collection: "comments", completion: completion)
    }
    func retrieveAlbums(for userId: String, completion: @escaping (Result<[Album], Error>)->Void) {
        fetchCollection(collection: "albums", completion: completion)
    }
    func retrievePhotos(for albumId: String, completion: @escaping (Result<[Photo], Error>)->Void) {
        fetchCollection(collection: "photos", completion: completion)
    }
    func retrieveTodos(for userId: String, completion: @escaping (Result<[Todo], Error>)->Void) {
        fetchCollection(collection: "todos", completion: completion)
    }
    func retrieveArticles(for userId: String, completion: @escaping (Result<[Article], Error>)->Void) {
        fetchCollection(collection: "articles", completion: completion)
    }
    func retrieveStories(completion: @escaping (Result<[Story], Error>) -> Void) {
        fetchCollection(collection: "stories", completion: completion)
    }
    
    private init() {}
    static let shared = FirestoreService()
    
    private let database = Firestore.firestore()
    private lazy var postTypesReference = database.collection("posts")
    private lazy var userTypesReference = database.collection("users")
    //private lazy var articlesTypesReference = database.collection("articles")
    
    func save(_ post: Post, completion: @escaping (Result<Bool, Error>) -> Void) {
        postTypesReference.addDocument(data: ["userId" :  post.userId,
                                              "id" : post.id,
                                              "title" : post.title,
                                              "body" : post.body,
                                              "photo" : post.photo ?? "",
                                              "type" : post.type,
                                              "createdTime": post.createdTime,
                                              "updatedTime": post.createdTime,
                                              "likes": post.likes,
                                              "comments": post.comments
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
    
    func fetchUsers(completion: @escaping (Result<[User], Error>)->Void) {

        userTypesReference.getDocuments(completion: { (snapshot, error) in
            guard let unwrappedSnapshot = snapshot else { return }
            
            let documents = unwrappedSnapshot.documents
            
            var users = [User]()
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
                
                let user = User(id: id, name: name, username: username, avatar: avatar, email: email, address: addressObject, phone: phone, website: website, company: companyObject)
                users.append(user)
                
            }
            
            completion(.success(users))
        })
    }
    
    /*
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
    */
    
    func listen(completion: @escaping (Result<[Post], Error>)->Void) {
        postTypesReference.addSnapshotListener { (snapshot, error) in
            guard let unwrappedSnapshot = snapshot else { return }
            
            let documents = unwrappedSnapshot.documents
            
            var posts = [Post]()
            for document in documents {
                let documentData = document.data()
                
                guard let userId = documentData["userId"] as? String,
                      let id = documentData["id"] as? String,
                      let title = documentData["title"] as? String,
                      let body = documentData["body"] as? String,
                      let photo = documentData["photo"] as? String?,
                      let type = documentData["type"] as? String,
                      let createdTime = documentData["createdTime"] as? Timestamp,
                      let updatedTime = documentData["updatedTime"] as? Timestamp,
                      let likes = documentData["likes"] as? Int,
                      let comments = documentData["comments"] as? [Comment] else {
                    continue
                }
                
                let post = Post(userId: userId, id: id, title: title, body: body, photo: photo, type: type, createdTime: createdTime.dateValue(), updatedTime: updatedTime.dateValue(), likes: likes, comments: comments)
                posts.append(post)
                
            }
            
            completion(.success(posts))
        }
    }
}
