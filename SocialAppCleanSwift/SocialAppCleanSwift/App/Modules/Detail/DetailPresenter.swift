//
//  DetailPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

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
