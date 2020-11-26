//
//  DetailPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  

import UIKit

protocol IDetailPresenter: class {
	// do someting...
}

class DetailPresenter: IDetailPresenter {	
	weak var view: IDetailViewController!
	
	init(view: IDetailViewController) {
		self.view = view
	}
}
