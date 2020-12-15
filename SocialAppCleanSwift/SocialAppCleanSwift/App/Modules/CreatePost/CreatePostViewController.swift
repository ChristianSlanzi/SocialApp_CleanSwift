//
//  CreatePostViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICreatePostViewController: class {
	// do someting...
}

class CreatePostViewController: UIViewController {
	var interactor: ICreatePostInteractor!
	var router: ICreatePostRouter!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension CreatePostViewController: ICreatePostViewController {
	// do someting...
}

extension CreatePostViewController {
	// do someting...
}

extension CreatePostViewController {
	// do someting...
}
