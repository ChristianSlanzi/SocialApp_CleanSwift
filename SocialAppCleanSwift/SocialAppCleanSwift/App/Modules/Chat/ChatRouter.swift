//
//  ChatRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 07.01.21.
//  Copyright (c) 2021 Christian Slanzi. All rights reserved.

import UIKit

protocol IChatRouter {
	// do someting...
}

class ChatRouter: IChatRouter {
    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ChatViewController {
        let bundle = Bundle(for: type(of: self))
        let view = ChatViewController(nibName: "ChatViewController", bundle: bundle)
        view.title = "chat_view_title".localized
        let presenter = ChatPresenter(view: view)
        let interactor = ChatInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}
