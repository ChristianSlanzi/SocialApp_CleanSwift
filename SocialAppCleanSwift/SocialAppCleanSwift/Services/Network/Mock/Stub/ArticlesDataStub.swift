//
//  ArticlesDataStub.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 10.12.20.
//

import SwiftyJSON

let articlesEmptyData = JSON(parseJSON: """
[

]
""")

let articlesData = JSON(parseJSON: """
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
