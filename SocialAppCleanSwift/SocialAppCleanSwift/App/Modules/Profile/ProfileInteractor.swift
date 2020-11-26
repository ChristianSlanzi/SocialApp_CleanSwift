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

class ProfileInteractor: IProfileInteractor {
    var presenter: IProfilePresenter!
    var parameters: [String: Any]?

    private var manager: IProfileManager {
        return ProfileManager()
    }

    init(presenter: IProfilePresenter) {
    	self.presenter = presenter
    }
}
