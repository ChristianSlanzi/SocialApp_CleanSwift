//
//  ContactsModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class ContactsModule: IModule {
    let appRouter: IAppRouter
    private var router: ContactsRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = ContactsRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension ContactsModule: Module {
    var routePath: String {
        return "Contacts"
    }
}
