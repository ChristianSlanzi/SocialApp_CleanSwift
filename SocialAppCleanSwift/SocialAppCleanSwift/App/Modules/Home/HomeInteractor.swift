//
//  HomeInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IHomeInteractor: class {
	var parameters: [String: Any]? { get }
}

class HomeInteractor: IHomeInteractor {
    var presenter: IHomePresenter!
    var parameters: [String: Any]?

    private var manager: IHomeManager {
        return HomeManager()
    }

    init(presenter: IHomePresenter) {
    	self.presenter = presenter
    }
}
