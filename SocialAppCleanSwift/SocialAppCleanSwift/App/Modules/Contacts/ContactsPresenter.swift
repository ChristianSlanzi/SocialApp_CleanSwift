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
        var displayedContacts: [ContactsModel.ViewModel.DisplayedContact] = []
        for contact in response.contacts {
          //let date = dateFormatter.string(from: order.date)
          //let total = currencyFormatter.string(from: order.total)
            let displayedContact = ContactsModel.ViewModel.DisplayedContact(name: contact.name ?? "no name")
          displayedContacts.append(displayedContact)
        }
        let viewModel = ContactsModel.ViewModel(displayedContacts: displayedContacts)
        view.displayFetchedContacts(viewModel: viewModel)
    }
}
