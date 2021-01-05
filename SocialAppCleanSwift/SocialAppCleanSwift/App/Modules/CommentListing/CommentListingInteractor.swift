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
    func getComments(request: CommentListingModel.Request)
}

protocol CommentDataStore
{
  var comments: [Comment]! { get set }
}

class CommentListingInteractor: ICommentListingInteractor, CommentDataStore {
    
    var comments: [Comment]!
    
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
        guard let postId = parameters?["postId"] as? String else { return }
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
    
    func getComments(request: CommentListingModel.Request) {
        if comments != nil {
            let response = CommentListingModel.Response(comments: comments)
            self.presenter.presentFetchedComments(response: response)
        }
    }
    
}
