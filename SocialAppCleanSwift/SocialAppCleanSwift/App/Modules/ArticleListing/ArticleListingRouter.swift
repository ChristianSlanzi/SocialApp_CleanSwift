//
//  ArticleListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleListingRouter {
	// do someting...
    func navigateToArticleDetail(for article: String)
}

class ArticleListingRouter: IArticleListingRouter {
    
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ArticleListingViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ArticleListingViewController(nibName: "ArticleListingViewController", bundle: bundle)
        let presenter = ArticleListingPresenter(view: view)
        let interactor = ArticleListingInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
    
    func navigateToArticleDetail(for articleTitle: String) {
        appRouter.presentModule(module: ArticleDetailModule(appRouter), parameters: ["title" : articleTitle])
    }
}
