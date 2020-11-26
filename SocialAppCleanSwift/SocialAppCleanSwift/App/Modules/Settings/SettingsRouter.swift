//
//  SettingsRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISettingsRouter {
	// do someting...
}

class SettingsRouter: ISettingsRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> SettingsViewController {
        let bundle = Bundle(for: type(of: self))
        let view = SettingsViewController(nibName: "SettingsViewController", bundle: bundle)
        let presenter = SettingsPresenter(view: view)
        let interactor = SettingsInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
