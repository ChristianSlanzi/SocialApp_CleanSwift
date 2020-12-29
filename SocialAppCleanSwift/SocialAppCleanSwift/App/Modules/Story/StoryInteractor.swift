//
//  StoryInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IStoryInteractor: class {
	var parameters: [String: Any]? { get }
}

class StoryInteractor: IStoryInteractor {
    var presenter: IStoryPresenter!
    var parameters: [String: Any]?

    private var manager: IStoryManager {
        return StoryManager()
    }

    init(presenter: IStoryPresenter) {
    	self.presenter = presenter
    }
}
