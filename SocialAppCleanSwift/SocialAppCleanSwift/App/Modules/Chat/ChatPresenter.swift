//
//  ChatPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 07.01.21.
//  Copyright (c) 2021 Christian Slanzi. All rights reserved.

import UIKit

protocol IChatPresenter: class {
	// do someting...
}

class ChatPresenter: IChatPresenter {	
	weak var view: IChatViewController!
	
	init(view: IChatViewController) {
		self.view = view
	}
}
