//
//  CreatePostModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class CreatePostModule: IModule {
    let appRouter: IAppRouter
    private var router: CreatePostRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = CreatePostRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension CreatePostModule: Module {
    var routePath: String {
        return "CreatePost"
    }
}
