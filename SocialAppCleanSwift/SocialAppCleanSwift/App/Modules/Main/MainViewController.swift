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
        
        let home = AppRouter.share.getModule(module: HomeModule(AppRouter.share))!
        home.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        let profile = AppRouter.share.getModule(module: ProfileModule(AppRouter.share))!
        profile.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        let detail = AppRouter.share.getModule(module: DetailModule(AppRouter.share))!
        detail.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let views = [home, profile, detail].map { UINavigationController(rootViewController: $0)
        }
        viewControllers = views
    }
    
}

extension MainViewController: IMainViewController {
    // do someting...
}

extension MainViewController {
    // do someting...
}

extension MainViewController {
    // do someting...
}
