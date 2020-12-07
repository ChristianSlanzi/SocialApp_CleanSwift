//
//  SellItemListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISellItemListingInteractor: class {
	var parameters: [String: Any]? { get }
}

class SellItemListingInteractor: ISellItemListingInteractor {
    var presenter: ISellItemListingPresenter!
    var parameters: [String: Any]?

    private var manager: ISellItemListingManager {
        return SellItemListingManager()
    }

    init(presenter: ISellItemListingPresenter) {
    	self.presenter = presenter
    }
}
