//
//  NetworkingServiceMock.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

class NetworkingServiceMock: ApiServiceInterface {

    private func retrieveItems<T: JSONinitiable>(json: JSON, completion: @escaping (Result<[T], Error>) -> Void) {
        if let data = json.array {
            let items = data.map({ T(json: JSON($0.object)) })
            completion(.success(items))
            return
        }
    }
    
    func retrieveComments(for postId: String, completion: @escaping (Result<[Comment], Error>) -> Void) {
        retrieveItems(json: commentsPost1Data, completion: completion)
        /*
        if let item = commentsPost1Data.array {
            let comments = item.map({ Comment(json: JSON($0.object)) })
            completion(.success(comments))
            return
        }*/
    }
    
    func retrieveAlbums(completion: @escaping (Result<[Album], Error>) -> Void) {
        retrieveItems(json: albumsData, completion: completion)
        /*
        if let item = albumsData.array {
            let albums = item.map({ Album(json: JSON($0.object)) })
            completion(.success(albums))
            return
        }*/
    }
    
    func retrievePhotos(completion: @escaping (Result<[Photo], Error>) -> Void) {
        retrieveItems(json: photosData, completion: completion)
        /*
        if let item = photosData.array {
            let photos = item.map({ Photo(json: JSON($0.object)) })
            completion(.success(photos))
            return
        }*/
    }
    
    func retrievePosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        retrieveItems(json: postsData, completion: completion)
        /*
        if let item = postsData.array {
            let posts = item.map({ Post(json: JSON($0.object)) })
            completion(.success(posts))
            return
        }*/
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
[{"userId": 1,"id": 1,"title": "sunt aut","body": "quia et"},{"userId": 1,"id": 2,"title": "qui est esse","body": "est rerum tempore"}]
""")

//fileprivate let postsData = JSON(parseJSON: """
//[
//{
//"userId": 1,
//"id": 1,
//"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//"body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//},
//{
//"userId": 1,
//"id": 2,
//"title": "qui est esse",
//"body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
//},
//{
//"userId": 1,
//"id": 3,
//"title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
//"body": "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
//},
//{
//"userId": 1,
//"id": 4,
//"title": "eum et est occaecati",
//"body": "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit"
//},
//{
//"userId": 1,
//"id": 5,
//"title": "nesciunt quas odio",
//"body": "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque"
//},
//{
//"userId": 1,
//"id": 6,
//"title": "dolorem eum magni eos aperiam quia",
//"body": "ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobis aliquid molestiae\nperspiciatis et ea nemo ab reprehenderit accusantium quas\nvoluptate dolores velit et doloremque molestiae"
//}
//]
//""")

    
fileprivate let commentsPost1Data = JSON("""
        [
          {
            "postId": 1,
            "id": 1,
            "name": "id labore ex et quam laborum",
            "email": "Eliseo@gardner.biz",
            "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
          },
          {
            "postId": 1,
            "id": 2,
            "name": "quo vero reiciendis velit similique earum",
            "email": "Jayne_Kuhic@sydney.com",
            "body": "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et"
          },
          {
            "postId": 1,
            "id": 3,
            "name": "odio adipisci rerum aut animi",
            "email": "Nikita@garfield.biz",
            "body": "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione"
          },
          {
            "postId": 1,
            "id": 4,
            "name": "alias odio sit",
            "email": "Lew@alysha.tv",
            "body": "non et atque\noccaecati deserunt quas accusantium unde odit nobis qui voluptatem\nquia voluptas consequuntur itaque dolor\net qui rerum deleniti ut occaecati"
          },
          {
            "postId": 1,
            "id": 5,
            "name": "vero eaque aliquid doloribus et culpa",
            "email": "Hayden@althea.biz",
            "body": "harum non quasi et ratione\ntempore iure ex voluptates in ratione\nharum architecto fugit inventore cupiditate\nvoluptates magni quo et"
          }
        ]
""")

fileprivate let albumsData = JSON("""
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

fileprivate let photosData = JSON("""
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

fileprivate let todosData = JSON("""
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
