//
//  DiscoverPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 13.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IDiscoverPresenter: class {
	// do someting...
}

class DiscoverPresenter: IDiscoverPresenter {	
	weak var view: IDiscoverViewController!
	
	init(view: IDiscoverViewController) {
		self.view = view
	}
}
