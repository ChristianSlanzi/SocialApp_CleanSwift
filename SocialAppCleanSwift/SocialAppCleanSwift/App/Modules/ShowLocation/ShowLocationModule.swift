//
//  ShowLocationModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class ShowLocationModule: IModule {
    let appRouter: IAppRouter
    private var router: ShowLocationRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = ShowLocationRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension ShowLocationModule: Module {
    var routePath: String {
        return "ShowLocation"
    }
}
