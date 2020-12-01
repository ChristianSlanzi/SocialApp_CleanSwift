//
//  CommentListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICommentListingPresenter: class {
	// do someting...
    func presentFetchedComments(response: CommentListingModel.Response)
}

class CommentListingPresenter: ICommentListingPresenter {

	weak var view: ICommentListingViewController!
	
	init(view: ICommentListingViewController) {
		self.view = view
	}
}

extension CommentListingPresenter {
    func presentFetchedComments(response: CommentListingModel.Response) {
        let displayedComments = response.comments.map { CommentListingModel.ViewModel.DisplayedComment(name: $0.name, body: $0.body) }
        let viewModel = CommentListingModel.ViewModel(displayedComments: displayedComments)
        view.displayFetchedComments(viewModel: viewModel)
    }
}
