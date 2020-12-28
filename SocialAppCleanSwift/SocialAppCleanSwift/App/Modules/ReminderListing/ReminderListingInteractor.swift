//
//  ReminderListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IReminderListingInteractor: class {
	var parameters: [String: Any]? { get }
    
    func fetchReminders(request: ReminderListingModel.Request)
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

extension ReminderListingInteractor {
    func fetchReminders(request: ReminderListingModel.Request) {
        guard let userId = parameters?["userId"] as? String else { return }
        Current.networkingService.retrieveReminders(for: userId) { (result) in
            switch(result) {
            case .success(let reminders):
                let response = ReminderListingModel.Response(reminders: reminders)
                self.presenter.presentFetchedReminders(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
