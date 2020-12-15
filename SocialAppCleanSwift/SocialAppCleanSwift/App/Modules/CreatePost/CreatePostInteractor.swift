//
//  CreatePostInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICreatePostInteractor: class {
	var parameters: [String: Any]? { get }
}

class CreatePostInteractor: ICreatePostInteractor {
    var presenter: ICreatePostPresenter!
    var parameters: [String: Any]?

    private var manager: ICreatePostManager {
        return CreatePostManager()
    }

    init(presenter: ICreatePostPresenter) {
    	self.presenter = presenter
    }
}
