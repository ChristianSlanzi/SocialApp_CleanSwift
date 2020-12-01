//
//  CommentListingModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct CommentListingModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]
        /*{
			// do someting...
			return nil
		}*/
	}

	struct Response {
        var comments: [Comment]
	}

	struct ViewModel {
        struct DisplayedComment {
            var name: String
            var body: String
        }
        var displayedComments: [DisplayedComment]
	}
}
