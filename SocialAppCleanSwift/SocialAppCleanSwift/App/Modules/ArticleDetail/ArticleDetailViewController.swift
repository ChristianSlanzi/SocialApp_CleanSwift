//
//  ArticleDetailViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleDetailViewController: class {
	// do someting...
}

class ArticleDetailViewController: UIViewController {
	var interactor: IArticleDetailInteractor!
	var router: IArticleDetailRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension ArticleDetailViewController: IArticleDetailViewController {
	// do someting...
}

extension ArticleDetailViewController {
	// do someting...
}

extension ArticleDetailViewController {
	// do someting...
}
