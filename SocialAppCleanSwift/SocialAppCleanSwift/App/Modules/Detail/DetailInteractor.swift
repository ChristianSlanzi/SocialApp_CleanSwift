//
//  DetailInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IDetailInteractor: class {
	var parameters: [String: Any]? { get }
}

class DetailInteractor: IDetailInteractor {
    var presenter: IDetailPresenter!
    var parameters: [String: Any]?

    private var manager: IDetailManager {
        return DetailManager()
    }

    init(presenter: IDetailPresenter) {
    	self.presenter = presenter
    }
}
