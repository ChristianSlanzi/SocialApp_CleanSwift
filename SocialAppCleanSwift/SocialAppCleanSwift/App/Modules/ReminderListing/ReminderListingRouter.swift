//
//  ReminderListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IReminderListingRouter {
	// do someting...
}

class ReminderListingRouter: IReminderListingRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ReminderListingViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ReminderListingViewController(nibName: "ReminderListingViewController", bundle: bundle)
        let presenter = ReminderListingPresenter(view: view)
        let interactor = ReminderListingInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
