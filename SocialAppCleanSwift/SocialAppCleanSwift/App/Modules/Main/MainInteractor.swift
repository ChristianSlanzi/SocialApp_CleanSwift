//
//  MainInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IMainInteractor: class {
	var parameters: [String: Any]? { get }
}

class MainInteractor: IMainInteractor {
    var presenter: IMainPresenter!
    var parameters: [String: Any]?

    private var manager: IMainManager {
        return MainManager()
    }

    init(presenter: IMainPresenter) {
    	self.presenter = presenter
    }
}
