//
//  CommentListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICommentListingInteractor: class {
	var parameters: [String: Any]? { get }
}

class CommentListingInteractor: ICommentListingInteractor {
    var presenter: ICommentListingPresenter!
    var parameters: [String: Any]?

    private var manager: ICommentListingManager {
        return CommentListingManager()
    }

    init(presenter: ICommentListingPresenter) {
    	self.presenter = presenter
    }
}
