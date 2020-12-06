//
//  PhotoListingModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct PhotoListingModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

    struct Response {
        var photos: [Photo]
    }

    struct ViewModel {
        struct DisplayedPhoto {
            var id: Int
            var name: String
            var thumbnailUrl: String
        }
        var displayedPhotos: [DisplayedPhoto]
    }
}
