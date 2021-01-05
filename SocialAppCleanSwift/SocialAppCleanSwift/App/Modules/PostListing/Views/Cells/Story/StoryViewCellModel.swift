//
//  StoryViewCellModel.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 05.01.21.
//

import Foundation

struct StoryViewCellModel {
    struct Request {
        // do someting...

        var parameters: [String: Any]?
    }

    struct Response {
        var user: User?
    }

    struct ViewModel {
        struct DisplayedUser {
            var name: String
            var userAvatarUrl: URL?
            var id: String

        }
        var displayedUser: DisplayedUser!
    }
}
