//
//  PostListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPostListingPresenter: class {
	// do someting...
    func presentFetchedPosts(response: PostListingModel.Response)
}

class PostListingPresenter: IPostListingPresenter {	
	weak var view: IPostListingViewController!
	
	init(view: IPostListingViewController) {
		self.view = view
	}
}

extension PostListingPresenter {
    func presentFetchedPosts(response: PostListingModel.Response) {
        var displayedPosts: [PostListingModel.ViewModel.DisplayedPost] = []
        for post in response.posts {
          //let date = dateFormatter.string(from: order.date)
          //let total = currencyFormatter.string(from: order.total)
            //guard let id = post.id, let title = post.title else { break }
            let displayedPost = PostListingModel.ViewModel.DisplayedPost(id: post.id, title: post.title)
            displayedPosts.append(displayedPost)
        }
        let viewModel = PostListingModel.ViewModel(displayedPosts: displayedPosts)
        view.displayFetchedPosts(viewModel: viewModel)
    }
}
