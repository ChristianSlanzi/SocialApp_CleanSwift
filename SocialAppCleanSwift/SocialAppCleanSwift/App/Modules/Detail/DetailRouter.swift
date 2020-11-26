//
//  DetailRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IDetailRouter {
	// do someting...
}

class DetailRouter: IDetailRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> DetailViewController {
        //let bundle = Bundle(for: type(of: self))
        let view = DetailViewController()//(nibName: "DetailViewController", bundle: bundle)
        let presenter = DetailPresenter(view: view)
        let interactor = DetailInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
