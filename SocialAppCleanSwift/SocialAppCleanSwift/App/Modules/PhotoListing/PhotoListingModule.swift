//
//  PhotoListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class PhotoListingModule: IModule {
    let appRouter: IAppRouter
    private var router: PhotoListingRouter!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = PhotoListingRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension PhotoListingModule: Module {
    var routePath: String {
        return "PhotoListing"
    }
}
