//
//  PostListingModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct PostListingModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
        var posts: [Post]
	}

	struct ViewModel {
        struct DisplayedPost {
            var id: Int
            var title: String
            var body: String
        }
        var displayedPosts: [DisplayedPost]
	}
}
