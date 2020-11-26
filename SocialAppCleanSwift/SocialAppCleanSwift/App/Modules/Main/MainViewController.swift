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

class MainViewController: UIViewController {
	var interactor: IMainInteractor!
	var router: IMainRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
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
