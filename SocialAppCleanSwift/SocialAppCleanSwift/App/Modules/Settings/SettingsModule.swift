//
//  SettingsModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class SettingsModule: IModule {
    let appRouter: IAppRouter
    private var router: SettingsRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = SettingsRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension SettingsModule: Module {
    var routePath: String {
        return "Settings"
    }
}
