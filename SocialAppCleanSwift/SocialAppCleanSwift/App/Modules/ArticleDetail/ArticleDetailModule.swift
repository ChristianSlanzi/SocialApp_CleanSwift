//
//  ArticleDetailModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class ArticleDetailModule: IModule {
    let appRouter: IAppRouter
    private var router: ArticleDetailRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = ArticleDetailRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension ArticleDetailModule: Module {
    var routePath: String {
        return "ArticleDetail"
    }
}
