//
//  SellItemListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISellItemListingRouter {
	// do someting...
}

class SellItemListingRouter: ISellItemListingRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> SellItemListingViewController {
        let bundle = Bundle(for: type(of: self))
        let view = SellItemListingViewController(nibName: "SellItemListingViewController", bundle: bundle)
        let presenter = SellItemListingPresenter(view: view)
        let interactor = SellItemListingInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
