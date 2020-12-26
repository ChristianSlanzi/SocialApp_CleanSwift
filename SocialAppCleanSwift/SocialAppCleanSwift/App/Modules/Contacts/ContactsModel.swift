//
//  ContactsModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

struct ContactsModel {
    struct Request {
        // do someting...

        var parameters: [String: Any]? {
            // do someting...
            return nil
        }
    }

    struct Response {
        var contacts: [UserModel]
    }

    struct ViewModel {
        struct DisplayedContact
        {
            var id: String
            //var date: String
            //var email: String
            var name: String
            //var total: String
            var avatarURL: URL?
        }
        var displayedContacts: [DisplayedContact]
    }
}
