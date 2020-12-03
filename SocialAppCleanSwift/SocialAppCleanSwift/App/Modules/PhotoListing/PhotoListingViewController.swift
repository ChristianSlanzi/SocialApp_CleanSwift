//
//  PhotoListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPhotoListingViewController: class {
	// do someting...
}

class PhotoListingViewController: UIViewController {
	var interactor: IPhotoListingInteractor!
	var router: IPhotoListingRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension PhotoListingViewController: IPhotoListingViewController {
	// do someting...
}

extension PhotoListingViewController {
	// do someting...
}

extension PhotoListingViewController {
	// do someting...
}
