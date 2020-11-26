//
//  ProfilePresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfilePresenter: class {
	// do someting...
}

class ProfilePresenter: IProfilePresenter {	
	weak var view: IProfileViewController!
	
	init(view: IProfileViewController) {
		self.view = view
	}
}
