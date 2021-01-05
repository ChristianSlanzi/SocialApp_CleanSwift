//
//  StoryViewCellInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 05.01.21.
//

import Foundation

protocol IStoryViewCellInteractor: class {
    var parameters: [String: Any]? { get }
    
    func fetchUser(request: StoryViewCellModel.Request)
}

class StoryViewCellInteractor: IStoryViewCellInteractor {

    var presenter: IStoryViewCellPresenter!
    var parameters: [String: Any]?
        
    var user: User?

    //private var manager: IStoryListingManager {
    //    return StoryListingManager()
    //}

    init(presenter: IStoryViewCellPresenter) {
        self.presenter = presenter
    }
}

extension StoryViewCellInteractor {
    func fetchUser(request: StoryViewCellModel.Request) {
        guard let userId = request.parameters?["userId"] as? String else { return }
        Current.networkingService.retrieveUser(for: userId, completion: { (result) in
            switch(result) {
            case .success(let user):
                let response = StoryViewCellModel.Response(user: user)
                self.presenter.presentFetchedUser(response: response)
            case .failure(let error):
                print(error)
            }
        })
    }
}
