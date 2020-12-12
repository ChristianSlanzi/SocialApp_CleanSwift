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
        let displayedPosts = response.posts.map {
            PostListingModel.ViewModel.DisplayedPost(id: $0.id, title: $0.title, body: $0.body, updatedTime: $0.updatedTime.toString(format:"dd. MMMM, yyyy HH:mm"), photoUrl: $0.photo != nil ? URL(string: $0.photo!) : nil)
        }
        let viewModel = PostListingModel.ViewModel(displayedPosts: displayedPosts)
        view.displayFetchedPosts(viewModel: viewModel)
    }
}
