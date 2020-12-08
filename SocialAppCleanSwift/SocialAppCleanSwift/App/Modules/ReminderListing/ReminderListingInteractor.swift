//
//  ReminderListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IReminderListingInteractor: class {
	var parameters: [String: Any]? { get }
}

class ReminderListingInteractor: IReminderListingInteractor {
    var presenter: IReminderListingPresenter!
    var parameters: [String: Any]?

    private var manager: IReminderListingManager {
        return ReminderListingManager()
    }

    init(presenter: IReminderListingPresenter) {
    	self.presenter = presenter
    }
}
