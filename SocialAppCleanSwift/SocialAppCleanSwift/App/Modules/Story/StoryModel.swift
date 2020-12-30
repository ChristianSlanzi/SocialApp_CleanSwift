//
//  StoryModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct StoryModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
		// do someting...
        var story: Story
	}

	struct ViewModel {
        struct DisplayedStory {
            var id: String
            var title: String
            var photoUrls: [URL]
            var currentPage: Int
        }
        var displayedStory: DisplayedStory
	}
}
