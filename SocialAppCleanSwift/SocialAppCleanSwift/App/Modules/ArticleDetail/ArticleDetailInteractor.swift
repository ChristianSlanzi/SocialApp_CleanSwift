//
//  ArticleDetailInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleDetailInteractor: class {
	var parameters: [String: Any]? { get }
}

class ArticleDetailInteractor: IArticleDetailInteractor {
    var presenter: IArticleDetailPresenter!
    var parameters: [String: Any]?

    private var manager: IArticleDetailManager {
        return ArticleDetailManager()
    }

    init(presenter: IArticleDetailPresenter) {
    	self.presenter = presenter
    }
}
