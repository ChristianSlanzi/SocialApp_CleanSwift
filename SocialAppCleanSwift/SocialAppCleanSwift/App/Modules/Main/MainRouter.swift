//
//  MainRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IMainRouter {
	// do someting...
}

class MainRouter: IMainRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> MainViewController {
        let bundle = Bundle(for: type(of: self))
        let view = MainViewController(nibName: "MainViewController", bundle: bundle)
        let presenter = MainPresenter(view: view)
        let interactor = MainInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
