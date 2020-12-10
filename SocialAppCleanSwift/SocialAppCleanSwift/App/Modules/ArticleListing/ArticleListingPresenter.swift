//
//  ArticleListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleListingPresenter: class {
	// do someting...
    func presentFetchedArticles(response: ArticleListingModel.Response)
}

class ArticleListingPresenter: IArticleListingPresenter {
	weak var view: IArticleListingViewController!
	
	init(view: IArticleListingViewController) {
		self.view = view
	}
}

extension ArticleListingPresenter {
    func presentFetchedArticles(response: ArticleListingModel.Response) {
        if response.articles.count == 0 {
            view.displayNoContentScreen()
            return
        }
        let displayedArticles = response.articles.map({ ArticleListingModel.ViewModel.DisplayedArticle(title: $0.title, authors: $0.authors, url: $0.website)})
        let viewModel = ArticleListingModel.ViewModel(displayedArticles: displayedArticles)
        view.displayFetchedArticles(viewModel: viewModel)
    }
}
