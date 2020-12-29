//
//  StoryViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IStoryViewController: class {
	// do someting...
}

class StoryViewController: UIViewController {
	var interactor: IStoryInteractor!
	var router: IStoryRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension StoryViewController: IStoryViewController {
	// do someting...
}

extension StoryViewController {
	// do someting...
}

extension StoryViewController {
	// do someting...
}
