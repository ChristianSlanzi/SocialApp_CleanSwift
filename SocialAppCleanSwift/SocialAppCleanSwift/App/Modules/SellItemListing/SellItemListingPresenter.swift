//
//  SellItemListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISellItemListingPresenter: class {
	// do someting...
}

class SellItemListingPresenter: ISellItemListingPresenter {	
	weak var view: ISellItemListingViewController!
	
	init(view: ISellItemListingViewController) {
		self.view = view
	}
}
