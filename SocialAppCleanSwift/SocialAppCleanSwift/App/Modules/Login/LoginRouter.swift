//
//  LoginRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol ILoginRouter {
    // do someting...
    func navigateToHome()
}

class LoginRouter: ILoginRouter {
    
    
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> LoginViewController {
        let bundle = Bundle(for: type(of: self))
        let view = LoginViewController() //(nibName: "LoginViewController", bundle: bundle)
        let presenter = LoginPresenter(view: view)
        let interactor = LoginInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view
    }
    
    func navigateToHome() {
        appRouter.presentModule(module: MainModule(appRouter), type: .root)
    }
}
