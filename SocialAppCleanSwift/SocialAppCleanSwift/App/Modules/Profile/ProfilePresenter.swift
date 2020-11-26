//
//  ProfilePresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

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
