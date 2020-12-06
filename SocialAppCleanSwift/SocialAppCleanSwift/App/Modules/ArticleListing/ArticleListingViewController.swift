//
//  ArticleListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleListingViewController: class {
	// do someting...
}

class ArticleListingViewController: UIViewController {
	var interactor: IArticleListingInteractor!
	var router: IArticleListingRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ArticleListingViewController: IArticleListingViewController {
	// do someting...
}

extension ArticleListingViewController {
	// do someting...
}

extension ArticleListingViewController {
	// do someting...
}
