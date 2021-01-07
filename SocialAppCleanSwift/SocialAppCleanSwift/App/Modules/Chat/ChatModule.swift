//
//  ChatModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 07.01.21.
//  Copyright (c) 2021 Christian Slanzi. All rights reserved.

import UIKit

class ChatModule: IModule {
    let appRouter: IAppRouter
    private var router: ChatRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = ChatRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension ChatModule: Module {
    var routePath: String {
        return "Chat"
    }
}
