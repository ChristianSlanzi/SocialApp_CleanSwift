//
//  ShowLocationInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IShowLocationInteractor: class {
	var parameters: [String: Any]? { get }
}

class ShowLocationInteractor: IShowLocationInteractor {
    var presenter: IShowLocationPresenter!
    var parameters: [String: Any]?

    private var manager: IShowLocationManager {
        return ShowLocationManager()
    }

    init(presenter: IShowLocationPresenter) {
    	self.presenter = presenter
    }
}
