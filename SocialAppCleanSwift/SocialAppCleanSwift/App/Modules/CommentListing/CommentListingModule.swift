//
//  CommentListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class CommentListingModule: IModule, CommentDataStore {
    
    let appRouter: IAppRouter
    private var router: CommentListingRouter!
    
    var comments: [Comment]!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = CommentListingRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.dataStore = self
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension CommentListingModule: Module {
    var routePath: String {
        return "CommentListing"
    }
}
