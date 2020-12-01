//
//  PostListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPostListingRouter {
	// do someting...
    func navigateToComments(for postId: Int)
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
    func navigateToComments(for postId: Int) {
        appRouter.presentModule(module: CommentListingModule(appRouter), parameters: ["postId" : postId])
    }
}
