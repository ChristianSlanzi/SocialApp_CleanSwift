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
    func fetchStories(request: StoryListingModel.Request)
}

class PostListingInteractor: IPostListingInteractor {

    var presenter: IPostListingPresenter!
    var parameters: [String: Any]?
    
    var networkingService: ApiServiceInterface?
    
    var posts: [Post]?
    var stories: [Story]?

    private var manager: IPostListingManager {
        return PostListingManager()
    }

    init(presenter: IPostListingPresenter) {
    	self.presenter = presenter
    }
}

extension PostListingInteractor {
    func fetchPosts(request: PostListingModel.Request) {
        networkingService?.retrievePosts { (result) in
            switch(result) {
            case .success(let posts):
                self.posts = posts
                let response = PostListingModel.Response(posts: posts)
                self.presenter.presentFetchedPosts(response: response)
            case .failure(let error):
                //show failure message
                print(error)
                break
            }
        }
    }
    
    func fetchStories(request: StoryListingModel.Request) {
        networkingService?.retrieveStories { (result) in
            switch(result) {
            case .success(let stories):
                self.stories = stories
                let response = StoryListingModel.Response(stories: stories)
                self.presenter.presentFetchedStories(response: response)
            case .failure(let error):
                //show failure message
                print(error)
                break
            }
        }
    }
}
