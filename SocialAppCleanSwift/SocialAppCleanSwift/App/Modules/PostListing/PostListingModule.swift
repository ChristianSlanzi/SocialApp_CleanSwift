//
//  PostListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class PostListingModule: IModule {
    let appRouter: IAppRouter
    private var router: PostListingRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = PostListingRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension PostListingModule: Module {
    var routePath: String {
        return "PostListing"
    }
}
