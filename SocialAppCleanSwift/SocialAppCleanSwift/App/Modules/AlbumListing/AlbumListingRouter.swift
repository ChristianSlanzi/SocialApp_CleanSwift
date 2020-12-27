//
//  AlbumListingRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IAlbumListingRouter {
	// do someting...
    func navigateToPhotos(for albumId: String)
}

class AlbumListingRouter: IAlbumListingRouter {

    var appRouter: IAppRouter

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> AlbumListingViewController {
        let bundle = Bundle(for: type(of: self))
        let view = AlbumListingViewController(nibName: "AlbumListingViewController", bundle: bundle)
        view.title = "albumlisting_view_title".localized
        let presenter = AlbumListingPresenter(view: view)
        let interactor = AlbumListingInteractor(presenter: presenter)
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
}

extension AlbumListingRouter {
    func navigateToPhotos(for albumId: String) {
        appRouter.presentModule(module: PhotoListingModule(appRouter), parameters: ["albumId" : albumId])
    }
}
