//
//  SellItemListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISellItemListingViewController: class {
	// do someting...
}

class SellItemListingViewController: UIViewController {
	var interactor: ISellItemListingInteractor!
	var router: ISellItemListingRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension SellItemListingViewController: ISellItemListingViewController {
	// do someting...
}

extension SellItemListingViewController {
	// do someting...
}

extension SellItemListingViewController {
	// do someting...
}
