//
//  CommentListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICommentListingInteractor: class {
	var parameters: [String: Any]? { get }
    
    func fetchComments(request: CommentListingModel.Request)
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

extension CommentListingInteractor {
    func fetchComments(request: CommentListingModel.Request) {
        guard let postId = request.parameters["postId"] as? String else { return }
        Current.networkingService.retrieveComments(for: postId) { (result) in
            switch(result) {
            case .success(let comments):
                let response = CommentListingModel.Response(comments: comments)
                self.presenter.presentFetchedComments(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
