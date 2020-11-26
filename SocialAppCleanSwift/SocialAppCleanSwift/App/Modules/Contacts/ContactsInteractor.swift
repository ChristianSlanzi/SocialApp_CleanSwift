//
//  ContactsInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IContactsInteractor: class {
	var parameters: [String: Any]? { get }
}

class ContactsInteractor: IContactsInteractor {
    var presenter: IContactsPresenter!
    var parameters: [String: Any]?

    private var manager: IContactsManager {
        return ContactsManager()
    }

    init(presenter: IContactsPresenter) {
    	self.presenter = presenter
    }
}
