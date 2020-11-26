//
//  HomeModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

class HomeModule: IModule {
    let appRouter: IAppRouter
    private var router: HomeRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = HomeRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension HomeModule: Module {
    var routePath: String {
        return "Home"
    }
}
