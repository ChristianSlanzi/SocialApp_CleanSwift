//
//  HomePresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IHomePresenter: class {
	// do someting...
}

class HomePresenter: IHomePresenter {	
	weak var view: IHomeViewController!
	
	init(view: IHomeViewController) {
		self.view = view
	}
}
