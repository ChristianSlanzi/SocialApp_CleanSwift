//
//  ContactsPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IContactsPresenter: class {
    // do someting...
    func presentFetchedContacts(response: ContactsModel.Response)
}

class ContactsPresenter: IContactsPresenter {

    weak var view: IContactsViewController!
    
    init(view: IContactsViewController) {
        self.view = view
    }
}

extension ContactsPresenter {
    func presentFetchedContacts(response: ContactsModel.Response) {
        let displayedContacts: [ContactsModel.ViewModel.DisplayedContact] = response.contacts.map {
            return ContactsModel.ViewModel.DisplayedContact(id: $0.id, name: $0.name, avatarURL: $0.avatar != nil ? URL(string: $0.avatar!) : nil)
        }
        let viewModel = ContactsModel.ViewModel(displayedContacts: displayedContacts)
        view.displayFetchedContacts(viewModel: viewModel)
    }
}
