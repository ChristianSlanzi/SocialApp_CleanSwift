//
//  StoryModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class StoryModule: IModule {
    let appRouter: IAppRouter
    private var router: StoryRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = StoryRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension StoryModule: Module {
    var routePath: String {
        return "Story"
    }
}
