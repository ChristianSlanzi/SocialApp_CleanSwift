//
//  PostListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPostListingInteractor: class {
	var parameters: [String: Any]? { get }
    
    func fetchPosts(request: PostListingModel.Request)
}

class PostListingInteractor: IPostListingInteractor {
    var presenter: IPostListingPresenter!
    var parameters: [String: Any]?
    var posts: [Post]?

    private var manager: IPostListingManager {
        return PostListingManager()
    }

    init(presenter: IPostListingPresenter) {
    	self.presenter = presenter
    }
}

extension PostListingInteractor {
    func fetchPosts(request: PostListingModel.Request) {
        NetworkingServiceMock.retrievePosts { (result) in
            switch(result) {
            case .success(let posts):
                self.posts = posts
                let response = PostListingModel.Response(posts: posts)
                self.presenter.presentFetchedPosts(response: response)
            case .failure(_):
                //show failure message
                break
            }
        }
    }
}
