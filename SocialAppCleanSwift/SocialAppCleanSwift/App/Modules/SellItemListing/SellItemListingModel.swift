//
//  SellItemListingModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct SellItemListingModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
		// do someting...
        var sellItems: [SellItem]
	}

	struct ViewModel {
        struct DisplayedSellItem {
            var title: String
            var description: String
            var price: String
            var image: String?
        }
        var displayedItems: [DisplayedSellItem]
	}
}
