//
//  CreatePostPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICreatePostPresenter: class {
	// do someting...
}

class CreatePostPresenter: ICreatePostPresenter {	
	weak var view: ICreatePostViewController!
	
	init(view: ICreatePostViewController) {
		self.view = view
	}
}
