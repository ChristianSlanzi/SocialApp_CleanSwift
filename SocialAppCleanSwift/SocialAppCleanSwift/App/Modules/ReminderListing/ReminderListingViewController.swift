//
//  ReminderListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IReminderListingViewController: class {
	// do someting...
}

class ReminderListingViewController: UIViewController {
	var interactor: IReminderListingInteractor!
	var router: IReminderListingRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ReminderListingViewController: IReminderListingViewController {
	// do someting...
}

extension ReminderListingViewController {
	// do someting...
}

extension ReminderListingViewController {
	// do someting...
}
