//
//  HomeViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

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
