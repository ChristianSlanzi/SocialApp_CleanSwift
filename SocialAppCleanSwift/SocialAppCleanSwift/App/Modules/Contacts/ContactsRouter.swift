//
//  ContactsRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IContactsRouter {
	// do someting...
}

class ContactsRouter: IContactsRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ContactsViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ContactsViewController()//(nibName: "ContactsViewController", bundle: bundle)
        let presenter = ContactsPresenter(view: view)
        let interactor = ContactsInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view
    }
}
