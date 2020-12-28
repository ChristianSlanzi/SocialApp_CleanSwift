//
//  ReminderListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IReminderListingPresenter: class {
	// do someting...
    func presentFetchedReminders(response: ReminderListingModel.Response)
}

class ReminderListingPresenter: IReminderListingPresenter {

	weak var view: IReminderListingViewController!
	
	init(view: IReminderListingViewController) {
		self.view = view
	}
    
    func presentFetchedReminders(response: ReminderListingModel.Response) {
        let displayedReminders = response.reminders.map {
            ReminderListingModel.ViewModel.DisplayedReminder(id: $0.id, title: $0.title, date: $0.date.toDayMonthYearTimeString())
        }
        let viewModel = ReminderListingModel.ViewModel(displayedReminders: displayedReminders)
        self.view.displayFetchedReminders(viewModel: viewModel)
    }
}
