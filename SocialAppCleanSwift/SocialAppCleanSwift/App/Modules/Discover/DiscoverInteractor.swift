//
//  DiscoverInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 13.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IDiscoverInteractor: class {
	var parameters: [String: Any]? { get }
}

class DiscoverInteractor: IDiscoverInteractor {
    var presenter: IDiscoverPresenter!
    var parameters: [String: Any]?

    private var manager: IDiscoverManager {
        return DiscoverManager()
    }

    init(presenter: IDiscoverPresenter) {
    	self.presenter = presenter
    }
}
