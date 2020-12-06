//
//  ArticleListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class ArticleListingModule: IModule {
    let appRouter: IAppRouter
    private var router: ArticleListingRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = ArticleListingRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension ArticleListingModule: Module {
    var routePath: String {
        return "ArticleListing"
    }
}
