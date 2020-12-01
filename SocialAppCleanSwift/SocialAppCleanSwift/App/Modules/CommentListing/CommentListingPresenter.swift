//
//  CommentListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICommentListingPresenter: class {
	// do someting...
}

class CommentListingPresenter: ICommentListingPresenter {	
	weak var view: ICommentListingViewController!
	
	init(view: ICommentListingViewController) {
		self.view = view
	}
}
