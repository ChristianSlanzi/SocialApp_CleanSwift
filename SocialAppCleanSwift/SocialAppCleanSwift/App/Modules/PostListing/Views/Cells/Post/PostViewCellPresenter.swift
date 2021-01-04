//
//  PostViewCellPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.01.21.
//

import UIKit

protocol IPostViewCellPresenter: class {
    func presentFetchedUser(response: PostViewCellModel.Response)
}

class PostViewCellPresenter: IPostViewCellPresenter {

    weak var view: IPostViewCell!
    
    init(view: IPostViewCell) {
        self.view = view
    }
}

extension PostViewCellPresenter {
    func presentFetchedUser(response: PostViewCellModel.Response) {
        guard let user = response.user else { return }
        let displayedUser = PostViewCellModel.ViewModel.DisplayedUser(name: user.name, userAvatarUrl: URL(string: user.avatar ?? ""), id: user.id)
        self.view.displayFetchedUser(viewModel: PostViewCellModel.ViewModel(displayedUser: displayedUser))
    }
}
