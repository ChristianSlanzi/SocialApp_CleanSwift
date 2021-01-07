//
//  ChatInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 07.01.21.
//  Copyright (c) 2021 Christian Slanzi. All rights reserved.

import UIKit

protocol IChatInteractor: class {
	var parameters: [String: Any]? { get }
}

class ChatInteractor: IChatInteractor {
    var presenter: IChatPresenter!
    var parameters: [String: Any]?

    private var manager: IChatManager {
        return ChatManager()
    }

    init(presenter: IChatPresenter) {
    	self.presenter = presenter
    }
}
