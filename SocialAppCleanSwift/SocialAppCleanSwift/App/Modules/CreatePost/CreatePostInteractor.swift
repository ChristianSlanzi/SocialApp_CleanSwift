//
//  CreatePostInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICreatePostInteractor: class {
	var parameters: [String: Any]? { get }
    
    func createPost(request: CreatePostModel.Request)
}

class CreatePostInteractor: ICreatePostInteractor {
    
    var presenter: ICreatePostPresenter!
    var parameters: [String: Any]?

    private var manager: ICreatePostManager {
        return CreatePostManager()
    }

    init(presenter: ICreatePostPresenter) {
    	self.presenter = presenter
    }
}

extension CreatePostInteractor {
    func createPost(request: CreatePostModel.Request) {
        let post = Post(userId: 0, id: 1, title: "test title", body: "test body", photo: nil, type: "text", createdTime: Date(), updatedTime: Date())
        Current.networkingService.save(post, completion: { (result) in
            switch(result) {
            case .success(let wasSaved):
                //let response = PostListingModel.Response(posts: posts)
                //self.presenter.presentFetchedPosts(response: response)
                break
            case .failure(let error):
                //show failure message
                print(error)
                break
            }
        })
    }
}
