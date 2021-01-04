//
//  ArticleListingModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct ArticleListingModel {	
	struct Request {
		// do someting...

        var parameters: [String: Any]?
	}

	struct Response {
		// do someting...
        var articles: [Article]
	}

    struct ViewModel {
        struct DisplayedArticle {
            var title: String
            var authors: String
            var url: String
        }
        var displayedArticles: [DisplayedArticle]
    }
}
