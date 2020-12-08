//
//  ArticleDetailPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleDetailPresenter: class {
	// do someting...
}

class ArticleDetailPresenter: IArticleDetailPresenter {	
	weak var view: IArticleDetailViewController!
	
	init(view: IArticleDetailViewController) {
		self.view = view
	}
}
