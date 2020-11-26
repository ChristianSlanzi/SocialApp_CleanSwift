//
//  ContactsPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IContactsPresenter: class {
	// do someting...
}

class ContactsPresenter: IContactsPresenter {	
	weak var view: IContactsViewController!
	
	init(view: IContactsViewController) {
		self.view = view
	}
}
