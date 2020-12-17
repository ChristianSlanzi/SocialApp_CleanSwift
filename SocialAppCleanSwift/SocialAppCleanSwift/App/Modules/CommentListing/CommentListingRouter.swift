//
//  CommentListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICommentListingRouter {
	// do someting...
}

class CommentListingRouter: ICommentListingRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> CommentListingViewController {
        let bundle = Bundle(for: type(of: self))
        let view = CommentListingViewController(nibName: "CommentListingViewController", bundle: bundle)
        view.title = "commentlisting_view_title".localized
        let presenter = CommentListingPresenter(view: view)
        let interactor = CommentListingInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
