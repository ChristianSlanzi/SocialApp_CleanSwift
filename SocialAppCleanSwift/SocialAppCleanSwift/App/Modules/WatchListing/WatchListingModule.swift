//
//  WatchListingModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 07.01.21.
//

import UIKit

class WatchListingModule: PostListingModule {

    override func createView(parameters: [String: Any]) -> UIViewController? {
        
        //let bundle = Bundle(for: type(of: self))
        let view = PostListingViewController()//(nibName: "PostListingViewController", bundle: bundle)
        view.title = "watchlisting_view_title".localized
        let presenter = PostListingPresenter(view: view)
        let interactor = WatchListingInteractor(presenter: presenter)
        interactor.networkingService = networkingService
        view.interactor = interactor
        router.view = view
        interactor.parameters = parameters
        return router.create(parameters: parameters)
    }
}

extension WatchListingModule {
    override var routePath: String {
        return "WatchListing"
    }
}
