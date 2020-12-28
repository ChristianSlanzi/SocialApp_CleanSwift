//
//  SellItemListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISellItemListingInteractor: class {
	var parameters: [String: Any]? { get }
    
    func fetchSellItems(request: SellItemListingModel.Request)
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

extension SellItemListingInteractor {
    func fetchSellItems(request: SellItemListingModel.Request) {
        guard let postId = parameters?["userId"] as? String else { return }
        Current.networkingService.retrieveSellItems(for: postId) { (result) in
            switch(result) {
            case .success(let items):
                let response = SellItemListingModel.Response(sellItems: items)
                self.presenter.presentFetchedSellItems(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
