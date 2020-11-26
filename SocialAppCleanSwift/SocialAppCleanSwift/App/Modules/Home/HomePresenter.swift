//
//  HomePresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

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
