//
//  ReminderListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IReminderListingPresenter: class {
	// do someting...
}

class ReminderListingPresenter: IReminderListingPresenter {	
	weak var view: IReminderListingViewController!
	
	init(view: IReminderListingViewController) {
		self.view = view
	}
}
