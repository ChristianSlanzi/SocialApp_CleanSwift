//
//  LoginModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

class LoginModule: IModule {
    let appRouter: IAppRouter
    private var router: LoginRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = LoginRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension LoginModule: Module {
    var routePath: String {
        return "Login"
    }
}
