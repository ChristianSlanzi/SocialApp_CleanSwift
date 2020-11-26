//
//  ContactsViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IContactsViewController: class {
	// do someting...
}

class ContactsViewController: UIViewController {
	var interactor: IContactsInteractor!
	var router: IContactsRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ContactsViewController: IContactsViewController {
	// do someting...
}

extension ContactsViewController {
	// do someting...
}

extension ContactsViewController {
	// do someting...
}
