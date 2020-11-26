//
//  ContactsInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IContactsInteractor: class {
    var parameters: [String: Any]? { get }
    
    func fetchContacts(request: ContactsModel.Request)
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

extension ContactsInteractor {
    func fetchContacts(request: ContactsModel.Request) {
        
        NetworkingService.retrieveUsers { (result) in
            switch(result) {
            case .success(let users):
                let response = ContactsModel.Response(contacts: users)
                self.presenter.presentFetchedContacts(response: response)
            case .failure(_):
                //show failure message
                break
            }
        }
        
    }
}
