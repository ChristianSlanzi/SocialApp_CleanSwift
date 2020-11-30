//
//  PostListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPostListingRouter {
	// do someting...
}

class PostListingRouter: IPostListingRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> PostListingViewController {
        //let bundle = Bundle(for: type(of: self))
        let view = PostListingViewController()//(nibName: "PostListingViewController", bundle: bundle)
        view.title = "Posts"
        let presenter = PostListingPresenter(view: view)
        let interactor = PostListingInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
