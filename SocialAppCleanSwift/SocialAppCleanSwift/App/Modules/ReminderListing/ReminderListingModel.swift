//
//  ReminderListingModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct ReminderListingModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
        var reminders: [Reminder]
	}

	struct ViewModel {
        struct DisplayedReminder {
            var id: String
            var title: String
            var date: String
        }
        var displayedReminders: [DisplayedReminder]
	}
}
