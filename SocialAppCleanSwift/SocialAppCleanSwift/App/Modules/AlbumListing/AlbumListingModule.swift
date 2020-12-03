//
//  AlbumListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class AlbumListingModule: IModule {
    let appRouter: IAppRouter
    private var router: AlbumListingRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = AlbumListingRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension AlbumListingModule: Module {
    var routePath: String {
        return "AlbumListing"
    }
}
