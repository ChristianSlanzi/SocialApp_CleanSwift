//
//  DiscoverRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 13.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IDiscoverRouter {
	// do someting...
}

class DiscoverRouter: IDiscoverRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> DiscoverViewController {
        let bundle = Bundle(for: type(of: self))
        let view = DiscoverViewController(nibName: "DiscoverViewController", bundle: bundle)
        view.title = "Discover"
        let presenter = DiscoverPresenter(view: view)
        let interactor = DiscoverInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
