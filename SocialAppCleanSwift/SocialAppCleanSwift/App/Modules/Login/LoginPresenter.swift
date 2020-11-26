//
//  LoginPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol ILoginPresenter: class {
	// do someting...
}

class LoginPresenter: ILoginPresenter {	
	weak var view: ILoginViewController!
	
	init(view: ILoginViewController) {
		self.view = view
	}
}
