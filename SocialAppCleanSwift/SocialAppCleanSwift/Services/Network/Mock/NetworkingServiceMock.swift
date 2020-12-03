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
    
    func retrieveComments(for postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        retrieveItems(json: commentsPost1Data, completion: completion)
    }
    
    func retrieveAlbums(completion: @escaping (Result<[Album], Error>) -> Void) {
        retrieveItems(json: albumsData, completion: completion)
    }
    
    func retrievePhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        retrieveItems(json: photosData, completion: completion)
    }
    
    func retrievePosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        retrieveItems(json: postsData, completion: completion)
    }
    
    func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {
        let users = [
            UserModel(json: JSON(parseJSON: """
{
                        "id": 1,
                        "name": "Leanne Graham",
                        "username": "Bret",
                        "email": "Sincere@april.biz",
                        "address": {
                          "street": "Kulas Light",
                          "suite": "Apt. 556",
                          "city": "Gwenborough",
                          "zipcode": "92998-3874",
                          "geo": {
                            "lat": "45.4734",
                            "lng": "9.1806"
                          }
                        },
                        "phone": "1-770-736-8031 x56442",
                        "website": "hildegard.org",
                        "company": {
                          "name": "Romaguera-Crona",
                          "catchPhrase": "Multi-layered client-server neural-net",
                          "bs": "harness real-time e-markets"
                        }
                      }
"""))
        ]
        completion(.success(users))
    }
}

fileprivate let postsData = JSON(parseJSON: """
[
{
"userId": 1,
"id": 1,
"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
"body": "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
},
{
"userId": 1,
"id": 2,
"title": "qui est esse",
"body": "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla"
},
{
"userId": 1,
"id": 3,
"title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
"body": "et iusto sed quo iure voluptatem occaecati omnis eligendi aut ad voluptatem doloribus vel accusantium quis pariatur molestiae porro eius odio et labore et velit aut"
},
{
"userId": 1,
"id": 4,
"title": "eum et est occaecati",
"body": "ullam et saepe reiciendis voluptatem adipisci sit amet autem assumenda provident rerum culpa quis hic commodi nesciunt rem tenetur doloremque ipsam iure quis sunt voluptatem rerum illo velit"
},
{
"userId": 1,
"id": 5,
"title": "nesciunt quas odio",
"body": "repudiandae veniam quaerat sunt sed alias aut fugiat sit autem sed est voluptatem omnis possimus esse voluptatibus quis est aut tenetur dolor neque"
},
{
"userId": 1,
"id": 6,
"title": "dolorem eum magni eos aperiam quia",
"body": "ut aspernatur corporis harum nihil quis provident sequi mollitia nobis aliquid molestiae perspiciatis et ea nemo ab reprehenderit accusantium quas voluptate dolores velit et doloremque molestiae"
}
]
""")

fileprivate let commentsPost1Data = JSON(parseJSON: """
[{"postId": 1,"id": 1,"name": "id labore ex et quam laborum","email": "Eliseo@gardner.biz","body": "laudantium enim quasi"},{"postId": 1,
"id": 3,
"name": "odio adipisci rerum aut animi",
"email": "Nikita@garfield.biz",
"body": "quia molestiae reprehenderit quasi aspernatur aut expedita occaecati aliquam eveniet laudantium omnis quibusdam delectus saepe quia accusamus maiores nam est cum et ducimus et vero voluptates excepturi deleniti ratione"},{"postId": 1,
"id": 4,
"name": "alias odio sit",
"email": "Lew@alysha.tv",
"body": "non et atque occaecati deserunt quas accusantium unde odit nobis qui voluptatem quia voluptas consequuntur itaque dolor et qui rerum deleniti ut occaecati"
},{"postId": 1,
"id": 5,
"name": "vero eaque aliquid doloribus et culpa",
"email": "Hayden@althea.biz",
"body": "harum non quasi et ratione tempore iure ex voluptates in ratione harum architecto fugit inventore cupiditate voluptates magni quo et"}]
""")

fileprivate let albumsData = JSON(parseJSON: """
        [
          {
            "userId": 1,
            "id": 1,
            "title": "quidem molestiae enim"
          },
          {
            "userId": 1,
            "id": 2,
            "title": "sunt qui excepturi placeat culpa"
          },
          {
            "userId": 1,
            "id": 3,
            "title": "omnis laborum odio"
          },
          {
            "userId": 1,
            "id": 4,
            "title": "non esse culpa molestiae omnis sed optio"
          },
          {
            "userId": 1,
            "id": 5,
            "title": "eaque aut omnis a"
          }
        ]
""")

fileprivate let photosData = JSON(parseJSON: """
        [
          {
              "albumId": 1,
              "id": 1,
              "title": "accusamus beatae ad facilis cum similique qui sunt",
              "url": "https://via.placeholder.com/600/92c952",
              "thumbnailUrl": "https://via.placeholder.com/150/92c952"
            },
            {
              "albumId": 1,
              "id": 2,
              "title": "reprehenderit est deserunt velit ipsam",
              "url": "https://via.placeholder.com/600/771796",
              "thumbnailUrl": "https://via.placeholder.com/150/771796"
            },
            {
              "albumId": 1,
              "id": 3,
              "title": "officia porro iure quia iusto qui ipsa ut modi",
              "url": "https://via.placeholder.com/600/24f355",
              "thumbnailUrl": "https://via.placeholder.com/150/24f355"
            },
            {
              "albumId": 1,
              "id": 4,
              "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
              "url": "https://via.placeholder.com/600/d32776",
              "thumbnailUrl": "https://via.placeholder.com/150/d32776"
            },
            {
              "albumId": 1,
              "id": 5,
              "title": "natus nisi omnis corporis facere molestiae rerum in",
              "url": "https://via.placeholder.com/600/f66b97",
              "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
            }
        ]
""")

fileprivate let todosData = JSON(parseJSON: """
        [
          {
              "userId": 1,
              "id": 1,
              "title": "delectus aut autem",
              "completed": false
            },
            {
              "userId": 1,
              "id": 2,
              "title": "quis ut nam facilis et officia qui",
              "completed": false
            },
            {
              "userId": 1,
              "id": 3,
              "title": "fugiat veniam minus",
              "completed": false
            },
            {
              "userId": 1,
              "id": 4,
              "title": "et porro tempora",
              "completed": true
            },
            {
              "userId": 1,
              "id": 5,
              "title": "laboriosam mollitia et enim quasi adipisci quia provident illum",
              "completed": false
            },
            {
              "userId": 1,
              "id": 6,
              "title": "qui ullam ratione quibusdam voluptatem quia omnis",
              "completed": false
            }
        ]
""")
