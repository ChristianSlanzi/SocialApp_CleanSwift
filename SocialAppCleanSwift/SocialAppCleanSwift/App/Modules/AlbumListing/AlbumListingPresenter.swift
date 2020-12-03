//
//  AlbumListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IAlbumListingPresenter: class {
	// do someting...
    func presentFetchedAlbums(response: AlbumListingModel.Response)
}

class AlbumListingPresenter: IAlbumListingPresenter {
	weak var view: IAlbumListingViewController!
	
	init(view: IAlbumListingViewController) {
		self.view = view
	}
}

extension AlbumListingPresenter {
    func presentFetchedAlbums(response: AlbumListingModel.Response) {
        let displayedAlbums = response.albums.map({
            AlbumListingModel.ViewModel.DisplayedAlbum(name: $0.title)
        })
        let viewModel = AlbumListingModel.ViewModel(displayedAlbums: displayedAlbums)
        view.displayFetchedAlbums(viewModel: viewModel)
    }
}
