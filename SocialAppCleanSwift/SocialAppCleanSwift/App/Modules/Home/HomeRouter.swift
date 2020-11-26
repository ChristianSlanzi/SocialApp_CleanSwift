//
//  HomeRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IHomeRouter {
	// do someting...
    func navigateToSettings(title: String)
}

class HomeRouter: IHomeRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> HomeViewController {
        //let bundle = Bundle(for: type(of: self))
        let view = HomeViewController()//(nibName: "HomeViewController", bundle: bundle)
        view.title = "Home"
        let presenter = HomePresenter(view: view)
        let interactor = HomeInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
    
    func navigateToSettings(title: String) {
        appRouter.presentModule(module: SettingsModule(appRouter), parameters: ["title" : title])
    }
}
