//
//  AlbumListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IAlbumListingViewController: class {
	// do someting...
}

class AlbumListingViewController: UIViewController {
	var interactor: IAlbumListingInteractor!
	var router: IAlbumListingRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension AlbumListingViewController: IAlbumListingViewController {
	// do someting...
}

extension AlbumListingViewController {
	// do someting...
}

extension AlbumListingViewController {
	// do someting...
}
