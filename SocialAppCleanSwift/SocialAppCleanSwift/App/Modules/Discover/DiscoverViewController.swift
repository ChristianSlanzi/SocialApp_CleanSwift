//
//  DiscoverViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 13.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IDiscoverViewController: class {
	// do someting...
}

class DiscoverViewController: UIViewController {
	var interactor: IDiscoverInteractor!
	var router: IDiscoverRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension DiscoverViewController: IDiscoverViewController {
	// do someting...
}

extension DiscoverViewController {
	// do someting...
}

extension DiscoverViewController {
	// do someting...
}
