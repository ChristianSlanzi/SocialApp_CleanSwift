//
//  NetworkService.swift
//  CleanVIPTutorial
//
//  Created by Christian Slanzi on 24.11.20.
//

import Alamofire
import SwiftyJSON

class NetworkingService: ApiServiceInterface {
    static func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {
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
    }
}

class NetworkingServiceMock: ApiServiceInterface {
    static func retrieveUsers(completion: @escaping (Result<[UserModel], Error>)->Void) {
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
                            "lat": "-37.3159",
                            "lng": "81.1496"
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
