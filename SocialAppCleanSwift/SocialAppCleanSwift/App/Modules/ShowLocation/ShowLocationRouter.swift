//
//  ShowLocationRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IShowLocationRouter {
	// do someting...
}

class ShowLocationRouter: IShowLocationRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ShowLocationViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ShowLocationViewController(nibName: "ShowLocationViewController", bundle: bundle)
        let presenter = ShowLocationPresenter(view: view)
        let interactor = ShowLocationInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
