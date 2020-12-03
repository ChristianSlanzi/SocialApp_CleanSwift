//
//  PhotoListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPhotoListingInteractor: class {
	var parameters: [String: Any]? { get }
}

class PhotoListingInteractor: IPhotoListingInteractor {
    var presenter: IPhotoListingPresenter!
    var parameters: [String: Any]?

    private var manager: IPhotoListingManager {
        return PhotoListingManager()
    }

    init(presenter: IPhotoListingPresenter) {
    	self.presenter = presenter
    }
}
