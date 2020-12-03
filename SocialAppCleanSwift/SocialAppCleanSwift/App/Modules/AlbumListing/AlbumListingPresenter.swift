//
//  AlbumListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IAlbumListingPresenter: class {
	// do someting...
}

class AlbumListingPresenter: IAlbumListingPresenter {	
	weak var view: IAlbumListingViewController!
	
	init(view: IAlbumListingViewController) {
		self.view = view
	}
}
