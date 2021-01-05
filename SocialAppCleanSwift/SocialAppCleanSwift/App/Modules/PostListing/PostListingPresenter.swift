//
//  PostListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPostListingPresenter: class {
    func presentFetchedPosts(response: PostListingModel.Response)
    func presentFetchedStories(response: StoryListingModel.Response)
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
            PostListingModel.ViewModel.DisplayedPost(id: $0.id,
                                                     userId: $0.userId,
                                                     title: $0.title,
                                                     body: $0.body,
                                                     updatedTime: $0.updatedTime.toString(format:"dd. MMMM, yyyy HH:mm"),
                                                     photoUrl: $0.photo != nil ? URL(string: $0.photo!) : nil,
                                                     likes: String($0.likes),
                                                     comments: String($0.comments.count))
        }
        let viewModel = PostListingModel.ViewModel(displayedPosts: displayedPosts)
        view.displayFetchedPosts(viewModel: viewModel)
    }
    
    func presentFetchedStories(response: StoryListingModel.Response) {
        let displayedStories: [StoryListingModel.ViewModel.DisplayedStory] = response.stories.map {
            let story = $0
            return StoryListingModel.ViewModel.DisplayedStory(id: story.id, title: story.title, updatedTime: story.updatedTime.toString(format:"dd. MMMM, yyyy HH:mm"), photoUrl: story.pages.compactMap{ URL(string: $0) })
        }
        let viewModel = StoryListingModel.ViewModel(displayedStories: displayedStories)
        view.displayFetchedStories(viewModel: viewModel)
    }
}
