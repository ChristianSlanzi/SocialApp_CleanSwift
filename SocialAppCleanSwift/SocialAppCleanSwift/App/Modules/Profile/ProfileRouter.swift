//
//  ProfileRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfileRouter {
	// do someting...
    func navigateToShowLocation()
}

protocol ShowContactDataPassing
{
  var dataStore: ShowContactDataStore? { get }
}

class ProfileRouter: IProfileRouter, ShowContactDataPassing {
    var appRouter: IAppRouter
    var dataStore: ShowContactDataStore?

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ProfileViewController {
        //let bundle = Bundle(for: type(of: self))
        let view = ProfileViewController()//(nibName: "ProfileViewController", bundle: bundle)
        let presenter = ProfilePresenter(view: view)
        let interactor = ProfileInteractor(presenter: presenter)
        interactor.user = dataStore?.user
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
    
    func navigateToShowLocation() {
        appRouter.presentModule(module: ShowLocationModule(appRouter),
                                parameters: ["lat" : dataStore?.user.address?.geo?.lat,
                                             "lng" : dataStore?.user.address?.geo?.lng])
    }
}
