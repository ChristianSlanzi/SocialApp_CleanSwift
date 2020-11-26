//
//  LoginInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol ILoginInteractor: class {
	var parameters: [String: Any]? { get }
}

class LoginInteractor: ILoginInteractor {
    var presenter: ILoginPresenter!
    var parameters: [String: Any]?

    private var manager: ILoginManager {
        return LoginManager()
    }

    init(presenter: ILoginPresenter) {
    	self.presenter = presenter
    }
}
