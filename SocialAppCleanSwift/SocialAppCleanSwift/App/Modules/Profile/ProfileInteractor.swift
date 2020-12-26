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
        let response = ProfileModel.Response(user: user)
        presenter?.presentUserProfile(response: response)
    }
}
