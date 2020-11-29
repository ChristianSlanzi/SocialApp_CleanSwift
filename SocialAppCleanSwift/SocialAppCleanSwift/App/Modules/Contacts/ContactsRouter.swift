//
//  ContactsRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IContactsRouter {
	// do someting...
    func navigateToProfile(for contactId: Int)
}

class ContactsRouter: IContactsRouter {

    var appRouter: IAppRouter
    var dataStore: ContactsDataStore?

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ContactsViewController {
        //let bundle = Bundle(for: type(of: self))
        let view = ContactsViewController()//(nibName: "ContactsViewController", bundle: bundle)
        view.title = "Contacts"
        let presenter = ContactsPresenter(view: view)
        let interactor = ContactsInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        dataStore = interactor
        return view
    }
}

extension ContactsRouter {
    func navigateToProfile(for contactId: Int) {
        let selectedContact = dataStore?.contacts?.first { $0.id == contactId }
        guard let contact = selectedContact else { return }
        let module = ProfileModule(appRouter)
        module.user = contact
        //TODO: ask appRouter to route to Profile model with contact as parameter
        appRouter.presentModule(module: module, parameters: ["contactId" : contactId])
    }
}
