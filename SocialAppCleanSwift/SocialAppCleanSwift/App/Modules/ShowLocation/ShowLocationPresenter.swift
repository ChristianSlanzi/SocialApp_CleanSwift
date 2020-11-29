//
//  ShowLocationPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IShowLocationPresenter: class {
	// do someting...
}

class ShowLocationPresenter: IShowLocationPresenter {	
	weak var view: IShowLocationViewController!
	
	init(view: IShowLocationViewController) {
		self.view = view
	}
}
