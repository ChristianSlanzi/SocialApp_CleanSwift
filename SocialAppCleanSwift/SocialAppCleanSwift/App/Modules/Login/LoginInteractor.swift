//
//  LoginInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

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
