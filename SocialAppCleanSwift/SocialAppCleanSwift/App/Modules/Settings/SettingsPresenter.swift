//
//  SettingsPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISettingsPresenter: class {
	// do someting...
}

class SettingsPresenter: ISettingsPresenter {	
	weak var view: ISettingsViewController!
	
	init(view: ISettingsViewController) {
		self.view = view
	}
}
