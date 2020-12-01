//
//  CommentListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICommentListingViewController: class {
	// do someting...
}

class CommentListingViewController: UIViewController {
	var interactor: ICommentListingInteractor!
	var router: ICommentListingRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CommentListingViewController: ICommentListingViewController {
	// do someting...
}

extension CommentListingViewController {
	// do someting...
}

extension CommentListingViewController {
	// do someting...
}
