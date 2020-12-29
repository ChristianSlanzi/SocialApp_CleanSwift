//
//  ProfileInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfileInteractor: class {
	var parameters: [String: Any]? { get }
}

protocol ShowContactBusinessLogic
{
  func getUser(request: ProfileModel.Request)
}

protocol ShowContactDataStore
{
  var user: User! { get set }
}

class ProfileInteractor: IProfileInteractor, ShowContactDataStore {
    var presenter: IProfilePresenter!
    var parameters: [String: Any]?
    
    var user: User!

    private var manager: IProfileManager {
        return ProfileManager()
    }

    init(presenter: IProfilePresenter) {
    	self.presenter = presenter
    }
}

extension ProfileInteractor: ShowContactBusinessLogic {
    func getUser(request: ProfileModel.Request) {
    
        if user != nil {
            let response = ProfileModel.Response(user: user)
            presenter?.presentUserProfile(response: response)
        } else {
            guard let userId = parameters?["userId"] as? String else { return }
            Current.networkingService.retrieveUser(for: userId) { (result) in
                switch(result) {
                case .success(let user):
                    let response = ProfileModel.Response(user: user)
                    self.presenter?.presentUserProfile(response: response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
