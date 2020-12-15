//
//  CreatePostRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICreatePostRouter {
	// do someting...
}

class CreatePostRouter: ICreatePostRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> CreatePostViewController {
        let bundle = Bundle(for: type(of: self))
        let view = CreatePostViewController(nibName: "CreatePostViewController", bundle: bundle)
        view.title = "Create Post"
        let presenter = CreatePostPresenter(view: view)
        let interactor = CreatePostInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
