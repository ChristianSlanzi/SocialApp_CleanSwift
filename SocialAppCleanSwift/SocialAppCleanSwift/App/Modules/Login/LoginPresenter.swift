//
//  LoginPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

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
