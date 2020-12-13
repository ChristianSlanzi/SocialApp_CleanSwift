//
//  DiscoverModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 13.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class DiscoverModule: IModule {
    let appRouter: IAppRouter
    private var router: DiscoverRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = DiscoverRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension DiscoverModule: Module {
    var routePath: String {
        return "Discover"
    }
}
