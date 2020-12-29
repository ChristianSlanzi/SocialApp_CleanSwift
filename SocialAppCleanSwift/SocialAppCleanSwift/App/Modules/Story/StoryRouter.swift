//
//  StoryRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IStoryRouter {
	// do someting...
}

class StoryRouter: IStoryRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> StoryViewController {
        let bundle = Bundle(for: type(of: self))
        let view = StoryViewController(nibName: "StoryViewController", bundle: bundle)
        view.title = "story_view_title".localized
        let presenter = StoryPresenter(view: view)
        let interactor = StoryInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
