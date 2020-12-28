//
//  SellItemListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISellItemListingPresenter: class {
	// do someting...
    func presentFetchedSellItems(response: SellItemListingModel.Response)
}

class SellItemListingPresenter: ISellItemListingPresenter {

	weak var view: ISellItemListingViewController!
	
	init(view: ISellItemListingViewController) {
		self.view = view
	}
    
    func presentFetchedSellItems(response: SellItemListingModel.Response) {
        let displayedItems = response.sellItems.map {
            SellItemListingModel.ViewModel.DisplayedSellItem(title: $0.title, description: $0.description, price: $0.price)
        }
        let viewModel = SellItemListingModel.ViewModel(displayedItems: displayedItems)
        self.view.displayFetchedItems(viewModel: viewModel)
    }
}
