//
//  ArticleListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleListingInteractor: class {
	var parameters: [String: Any]? { get }
    
    func fetchArticles(request: ArticleListingModel.Request)
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

extension ArticleListingInteractor {
    func fetchArticles(request: ArticleListingModel.Request) {
        guard let userId = parameters?["userId"] as? String else { return }
        Current.networkingService.retrieveArticles(for: userId) { (result) in
            switch(result) {
            case .success(let articles):
                let response = ArticleListingModel.Response(articles: articles)
                self.presenter.presentFetchedArticles(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
