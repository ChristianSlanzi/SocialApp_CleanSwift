//
//  PostViewCellInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.01.21.
//

protocol IPostViewCellInteractor: class {
    var parameters: [String: Any]? { get }
    
    func fetchUser(request: PostViewCellModel.Request)
}

class PostViewCellInteractor: IPostViewCellInteractor {

    var presenter: IPostViewCellPresenter!
    var parameters: [String: Any]?
        
    var user: User?

    private var manager: IPostListingManager {
        return PostListingManager()
    }

    init(presenter: IPostViewCellPresenter) {
        self.presenter = presenter
    }
}

extension PostViewCellInteractor {
    func fetchUser(request: PostViewCellModel.Request) {
        guard let userId = request.parameters?["userId"] as? String else { return }
        Current.networkingService.retrieveUser(for: userId, completion: { (result) in
            switch(result) {
            case .success(let user):
                let response = PostViewCellModel.Response(user: user)
                self.presenter.presentFetchedUser(response: response)
            case .failure(let error):
                print(error)
            }
        })
    }
}
