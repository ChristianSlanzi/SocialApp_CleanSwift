//
//  TodoListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ITodoListingRouter {
	// do someting...
    //func navigateToPhotos(for albumId: Int)
}

class TodoListingRouter: ITodoListingRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> TodoListingViewController {
        let bundle = Bundle(for: type(of: self))
        let view = TodoListingViewController(nibName: "TodoListingViewController", bundle: bundle)
        view.title = "todolisting_view_title".localized
        let presenter = TodoListingPresenter(view: view)
        let interactor = TodoListingInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
