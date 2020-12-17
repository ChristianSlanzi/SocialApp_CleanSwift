//
//  ArticleDetailRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleDetailRouter {
	// do someting...
}

class ArticleDetailRouter: IArticleDetailRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ArticleDetailViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ArticleDetailViewController(nibName: "ArticleDetailViewController", bundle: bundle)
        view.title = "articledetail_view_title".localized
        let presenter = ArticleDetailPresenter(view: view)
        let interactor = ArticleDetailInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
