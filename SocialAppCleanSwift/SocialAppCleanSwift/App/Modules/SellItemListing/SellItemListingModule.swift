//
//  SellItemListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class SellItemListingModule: IModule {
    let appRouter: IAppRouter
    private var router: SellItemListingRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = SellItemListingRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension SellItemListingModule: Module {
    var routePath: String {
        return "SellItemListing"
    }
}
