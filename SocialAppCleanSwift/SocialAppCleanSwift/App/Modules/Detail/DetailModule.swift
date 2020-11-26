//
//  DetailModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

class DetailModule: IModule {
    let appRouter: IAppRouter
    private var router: DetailRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = DetailRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension DetailModule: Module {
    var routePath: String {
        return "Detail"
    }
}
