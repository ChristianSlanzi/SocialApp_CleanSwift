//
//  MainModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

class MainModule: IModule {
    let appRouter: IAppRouter
    private var router: MainRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = MainRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension MainModule: Module {
    var routePath: String {
        return "Main"
    }
}
