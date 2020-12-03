//
//  PhotoListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPhotoListingPresenter: class {
	// do someting...
}

class PhotoListingPresenter: IPhotoListingPresenter {	
	weak var view: IPhotoListingViewController!
	
	init(view: IPhotoListingViewController) {
		self.view = view
	}
}
