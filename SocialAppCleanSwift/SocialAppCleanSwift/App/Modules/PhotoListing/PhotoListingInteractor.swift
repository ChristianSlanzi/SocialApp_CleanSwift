//
//  PhotoListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPhotoListingInteractor: class {
	var parameters: [String: Any]? { get }
    func fetchPhotos(request: PhotoListingModel.Request)
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

extension PhotoListingInteractor {
    func fetchPhotos(request: PhotoListingModel.Request) {
        guard let albumId = parameters?["albumId"] as? String else { return }
        Current.networkingService.retrievePhotos(for: albumId) { (result) in
            switch(result) {
            case .success(let photos):
                let response = PhotoListingModel.Response(photos: photos)
                self.presenter.presentFetchedPhotos(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
