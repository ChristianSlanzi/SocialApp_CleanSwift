//
//  AlbumListingModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct AlbumListingModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]?
	}

	struct Response {
        var albums: [Album]
	}

	struct ViewModel {
        struct DisplayedAlbum {
            var id: String
            var name: String
        }
        var displayedAlbums: [DisplayedAlbum]
	}
}
