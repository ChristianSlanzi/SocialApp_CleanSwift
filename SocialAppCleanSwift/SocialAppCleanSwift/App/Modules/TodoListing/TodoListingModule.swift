//
//  TodoListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class TodoListingModule: IModule {
    let appRouter: IAppRouter
    private var router: TodoListingRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = TodoListingRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension TodoListingModule: Module {
    var routePath: String {
        return "TodoListing"
    }
}
