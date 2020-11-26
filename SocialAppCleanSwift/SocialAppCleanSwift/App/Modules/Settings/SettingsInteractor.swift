//
//  SettingsInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISettingsInteractor: class {
	var parameters: [String: Any]? { get }
}

class SettingsInteractor: ISettingsInteractor {
    var presenter: ISettingsPresenter!
    var parameters: [String: Any]?

    private var manager: ISettingsManager {
        return SettingsManager()
    }

    init(presenter: ISettingsPresenter) {
    	self.presenter = presenter
    }
}
