//
//  HomeViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import UIKit

protocol IHomeViewController: class {
	// do someting...
}

class HomeViewController: UIViewController {
	var interactor: IHomeInteractor!
	var router: IHomeRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension HomeViewController: IHomeViewController {
	// do someting...
}

extension HomeViewController {
	// do someting...
}

extension HomeViewController {
	// do someting...
}
