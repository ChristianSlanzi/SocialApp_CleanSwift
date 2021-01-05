//
//  StoryViewCellPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 05.01.21.
//

import UIKit

protocol IStoryViewCellPresenter: class {
    func presentFetchedUser(response: StoryViewCellModel.Response)
}

class StoryViewCellPresenter: IStoryViewCellPresenter {

    weak var view: IStoryViewCell!
    
    init(view: IStoryViewCell) {
        self.view = view
    }
}

extension StoryViewCellPresenter {
    func presentFetchedUser(response: StoryViewCellModel.Response) {
        guard let user = response.user else { return }
        let displayedUser = StoryViewCellModel.ViewModel.DisplayedUser(name: user.name, userAvatarUrl: URL(string: user.avatar ?? ""), id: user.id)
        self.view.displayFetchedUser(viewModel: StoryViewCellModel.ViewModel(displayedUser: displayedUser))
    }
}
