//
//  MainViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IMainViewController: class {
    // do someting...
}

class MainViewController: UITabBarController {
    var interactor: IMainInteractor!
    var router: IMainRouter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        
        let feeds = AppRouter.share.getModule(module: PostListingModule(AppRouter.share))!
        feeds.tabBarItem = UITabBarItem(title: "home_tab_title".localized, image: UIImage(named: "home-tab"), tag: 0)
        
        let discover = AppRouter.share.getModule(module: DiscoverModule(AppRouter.share))!
        discover.tabBarItem = UITabBarItem(title: "discover_tab_title".localized, image: UIImage(named: "search-tab"), tag: 1)
        
        let contacts = AppRouter.share.getModule(module: ContactsModule(AppRouter.share))!
        contacts.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        //let profile = AppRouter.share.getModule(module: ProfileModule(AppRouter.share))!
        //profile.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        //let detail = AppRouter.share.getModule(module: DetailModule(AppRouter.share))!
        //detail.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let home = AppRouter.share.getModule(module: HomeModule(AppRouter.share))!
        home.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        
        let views = [feeds, discover, contacts, home].map { UINavigationController(rootViewController: $0)
        }
        viewControllers = views
        
        delegate = self
    }
    
}

extension MainViewController: IMainViewController {
    // do someting...
}

extension MainViewController {
    // do someting...
}

extension MainViewController: UITabBarControllerDelegate {
    // do someting...
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        //AppRouter.share.
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        AppRouter.share.switchTabPresentedView(tabBarController: self)
    }
}
