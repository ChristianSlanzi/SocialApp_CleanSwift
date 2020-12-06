//
//  ArticleListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleListingPresenter: class {
	// do someting...
}

class ArticleListingPresenter: IArticleListingPresenter {	
	weak var view: IArticleListingViewController!
	
	init(view: IArticleListingViewController) {
		self.view = view
	}
}
