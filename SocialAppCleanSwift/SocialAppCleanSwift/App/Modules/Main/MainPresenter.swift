//
//  MainPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  

import UIKit

protocol IMainPresenter: class {
	// do someting...
}

class MainPresenter: IMainPresenter {	
	weak var view: IMainViewController!
	
	init(view: IMainViewController) {
		self.view = view
	}
}
