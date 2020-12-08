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

fileprivate let articlesEmptyData = JSON(parseJSON: """
[

]
""")

fileprivate let articlesData = JSON(parseJSON: """
[
      {
        "date": "2020-12-08",
        "title": "Repubblica Homepage",
        "website": "https://www.repubblica.it",
        "authors": "Rizzoli",
        "content": "La Homepage del quotidiano La Repubblica",
        "imageUrl": "https://www.google.de/url?sa=i&url=http%3A%2F%2Fgetlogo.net%2Fla-repubblica-logo-vector-svg%2F&psig=AOvVaw1M1OiJAP8XWXAh514Op8op&ust=1607542003457000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKC52OWOv-0CFQAAAAAdAAAAABAJ"
      },
      {
        "date": "2020-12-08",
        "title": "Berliner Morgenpost Homepage",
        "website": "https://www.morgenpost.de",
        "authors": "Berliner Morgenpost GmbH",
        "content": "La Homepage del quotidiano Berliner Morgenpost",
        "imageUrl": "https://www.google.de/imgres?imgurl=https%3A%2F%2Fpbs.twimg.com%2Fprofile_images%2F1118278022%2FBM_Twitter_Profil_neu_400x400.png&imgrefurl=https%3A%2F%2Ftwitter.com%2Fmorgenpost&tbnid=2frR6hj9y-XaCM&vet=12ahUKEwiC2L6aj7_tAhWP-KQKHQAVBUoQMygLegUIARC_AQ..i&docid=mOcLGmm8Ab36_M&w=400&h=400&q=berliner%20morgenpost&client=safari&ved=2ahUKEwiC2L6aj7_tAhWP-KQKHQAVBUoQMygLegUIARC_AQ"
      },
      {
        "date": "2020-12-08",
        "title": "GitHub Homepage",
        "website": "https://www.github.com",
        "authors": "GitHub",
        "content": "La Homepage del sito GitHub",
        "imageUrl": "https://www.google.de/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fe%2Fef%2FOcticons-logo-github.svg%2F1200px-Octicons-logo-github.svg.png&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FGitHub&tbnid=OcCRkYmD4P7ALM&vet=12ahUKEwitibjBj7_tAhWUgKQKHbIDDH8QMygIegUIARC2AQ..i&docid=QzSFWmycF5y8bM&w=1200&h=427&q=github&client=safari&ved=2ahUKEwitibjBj7_tAhWUgKQKHbIDDH8QMygIegUIARC2AQ"
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
