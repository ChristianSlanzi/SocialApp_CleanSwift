//
//  ProfileRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfileRouter {
	// do someting...
    func navigateToShowLocation()
    func navigateToAlbumListing()
    func navigateToTodoListing()
    func navigateToArticleListing()
    func navigateToReminderListing()
    func navigateToMarketplace()
}

protocol ShowContactDataPassing
{
  var dataStore: ShowContactDataStore? { get }
}

class ProfileRouter: IProfileRouter, ShowContactDataPassing {
    var appRouter: IAppRouter
    var dataStore: ShowContactDataStore?

    init(appRouter: IAppRouter) {
        self.appRouter = appRouter
    }

    func presentView(parameters: [String: Any]) {
        appRouter.presentView(view: create(parameters: parameters))
    }

    func create(parameters: [String: Any]) -> ProfileViewController {
        //let bundle = Bundle(for: type(of: self))
        let view = ProfileViewController()//(nibName: "ProfileViewController", bundle: bundle)
        view.title = "profile_view_title".localized
        let presenter = ProfilePresenter(view: view)
        let interactor = ProfileInteractor(presenter: presenter)
        interactor.user = dataStore?.user
        view.interactor = interactor
        view.router = self
        interactor.parameters = parameters
        return view        
    }
    
    func navigateToShowLocation() {
        if let location = dataStore?.user.address?.geo {
            appRouter.presentModule(module: ShowLocationModule(appRouter),
                                    parameters: ["lat" : location.lat,
                                                 "lng" : location.lng])
        } else {
            //TODO
        }
        
    }
    
    func navigateToAlbumListing() {
        guard let userId = dataStore?.user.id else { return }
        appRouter.presentModule(module: AlbumListingModule(appRouter),
                                parameters: ["userId" : userId])
    }
    
    func navigateToTodoListing() {
        guard let userId = dataStore?.user.id else { return }
        appRouter.presentModule(module: TodoListingModule(appRouter),
                                parameters: ["userId" : userId])
    }
    
    func navigateToArticleListing() {
        guard let userId = dataStore?.user.id else { return }
        appRouter.presentModule(module: ArticleListingModule(appRouter),
                                parameters: ["userId" : userId])
    }
    
    func navigateToReminderListing() {
        guard let userId = dataStore?.user.id else { return }
        appRouter.presentModule(module: ReminderListingModule(appRouter),
                                parameters: ["userId" : userId])
    }
    
    func navigateToMarketplace() {
        guard let userId = dataStore?.user.id else { return }
        appRouter.presentModule(module: SellItemListingModule(appRouter),
                                parameters: ["userId" : userId])
    }
}
