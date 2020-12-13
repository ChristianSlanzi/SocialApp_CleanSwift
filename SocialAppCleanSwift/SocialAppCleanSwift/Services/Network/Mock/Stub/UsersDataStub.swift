//
//  UsersDataStub.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 10.12.20.
//

import SwiftyJSON

let usersData = JSON(parseJSON: """
[
    {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "avatar": "https://github.com/ChristianSlanzi/SocialAppJson/blob/main/avatars/id1.png?raw=true",
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
    },
    {
      "id": 2,
      "name": "Anthony Graham",
      "username": "Thony",
        "avatar": "https://github.com/ChristianSlanzi/SocialAppJson/blob/main/avatars/id2.png?raw=true",
      "email": "thonyg@buzz.biz",
      "address": {
        "street": "Green Light",
        "suite": "Apt. 223",
        "city": "Denver",
        "zipcode": "92998-3874",
        "geo": {
          "lat": "23.4734",
          "lng": "45.1806"
        }
      },
      "phone": "1-770-736-8031 x56442",
      "website": "agrahm.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    }
]
""")
