//
//  PhotoListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPhotoListingRouter {
	// do someting...
}

class PhotoListingRouter: IPhotoListingRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> PhotoListingViewController {
        let bundle = Bundle(for: type(of: self))
        let view = PhotoListingViewController(nibName: "PhotoListingViewController", bundle: bundle)
        let presenter = PhotoListingPresenter(view: view)
        let interactor = PhotoListingInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
