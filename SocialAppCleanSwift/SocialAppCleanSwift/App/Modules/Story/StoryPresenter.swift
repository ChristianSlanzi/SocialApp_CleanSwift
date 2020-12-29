//
//  StoryPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IStoryPresenter: class {
	// do someting...
}

class StoryPresenter: IStoryPresenter {	
	weak var view: IStoryViewController!
	
	init(view: IStoryViewController) {
		self.view = view
	}
}
