//
//  ProfileModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

struct ProfileModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
		// do someting...
        var user: UserModel
	}

	struct ViewModel {
		// do someting...
        struct DisplayedUser {
            var name: String
        }
        var displayedUser: DisplayedUser
	}
}
