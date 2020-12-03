//
//  PhotoListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPhotoListingPresenter: class {
	// do someting...
    func presentFetchedPhotos(response: PhotoListingModel.Response)
}

class PhotoListingPresenter: IPhotoListingPresenter {

	weak var view: IPhotoListingViewController!
	
	init(view: IPhotoListingViewController) {
		self.view = view
	}
}

extension PhotoListingPresenter {
    func presentFetchedPhotos(response: PhotoListingModel.Response) {
        let displayedPhotos = response.photos.map({ PhotoListingModel.ViewModel.DisplayedPhoto(id: $0.id, name: $0.title) })
        let viewModel = PhotoListingModel.ViewModel(displayedPhotos: displayedPhotos)
        view.displayFetchedPhotos(viewModel: viewModel)
    }
}
