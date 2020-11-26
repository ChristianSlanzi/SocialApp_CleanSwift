//
//  ProfileRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfileRouter {
	// do someting...
}

class ProfileRouter: IProfileRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ProfileViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ProfileViewController(nibName: "ProfileViewController", bundle: bundle)
        let presenter = ProfilePresenter(view: view)
        let interactor = ProfileInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
