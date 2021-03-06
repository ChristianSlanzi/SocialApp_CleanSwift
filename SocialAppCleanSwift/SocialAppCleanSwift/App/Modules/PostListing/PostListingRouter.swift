//
//  PostListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPostListingRouter {
	// do someting...
    func navigateToComments(for postId: String, comments: [Comment])
    func navigateToCreatePost()
    func navigateToStory(story: Story)
}

class PostListingRouter: IPostListingRouter {

    var appRouter: IAppRouter
    var view: PostListingViewController!

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> PostListingViewController {
        view.router = self
        return view        
    }
}

extension PostListingRouter {
    func navigateToComments(for postId: String, comments: [Comment]) {
        let commentsModule = CommentListingModule(appRouter)
        commentsModule.comments = comments
        appRouter.presentModule(module: commentsModule, parameters: ["postId" : postId])
    }
    
    func navigateToCreatePost() {
        appRouter.presentModule(module: CreatePostModule(appRouter), parameters: [:])
    }
    
    func navigateToStory(story: Story) {
        let module = StoryModule(appRouter)
        module.story = story
        appRouter.presentModule(module: module, parameters: ["storyId" : story.id])
    }
}
