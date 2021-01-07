//
//  PostListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

class PostListingModule: IModule {
    let appRouter: IAppRouter
    var networkingService: ApiServiceInterface?
    
    var router: PostListingRouter!
    //private var presenter: PostListingPresenter!
    //private var interactor: PostListingInteractor!
    //private var view: PostListingViewController!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = PostListingRouter(appRouter: self.appRouter)
        networkingService = Current.networkingService
    }

    func presentView(parameters: [String: Any]) {
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        
        //let bundle = Bundle(for: type(of: self))
        let view = PostListingViewController()//(nibName: "PostListingViewController", bundle: bundle)
        view.title = "postlisting_view_title".localized
        let presenter = PostListingPresenter(view: view)
        let interactor = PostListingInteractor(presenter: presenter)
        interactor.networkingService = networkingService
        view.interactor = interactor
        router.view = view
        interactor.parameters = parameters
        return router.create(parameters: parameters)
    }
}

extension PostListingModule: Module {
    @objc var routePath: String {
        return "PostListing"
    }
}
