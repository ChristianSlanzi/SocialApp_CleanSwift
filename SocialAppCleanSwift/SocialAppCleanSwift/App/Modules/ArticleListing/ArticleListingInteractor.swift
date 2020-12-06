//
//  ArticleListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleListingInteractor: class {
	var parameters: [String: Any]? { get }
}

class ArticleListingInteractor: IArticleListingInteractor {
    var presenter: IArticleListingPresenter!
    var parameters: [String: Any]?

    private var manager: IArticleListingManager {
        return ArticleListingManager()
    }

    init(presenter: IArticleListingPresenter) {
    	self.presenter = presenter
    }
}
