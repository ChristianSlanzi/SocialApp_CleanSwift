//
//  AlbumListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IAlbumListingInteractor: class {
	var parameters: [String: Any]? { get }
    
    func fetchAlbums(request: AlbumListingModel.Request)
}

class AlbumListingInteractor: IAlbumListingInteractor {
    var presenter: IAlbumListingPresenter!
    var parameters: [String: Any]?

    private var manager: IAlbumListingManager {
        return AlbumListingManager()
    }

    init(presenter: IAlbumListingPresenter) {
    	self.presenter = presenter
    }
}

extension AlbumListingInteractor {
    func fetchAlbums(request: AlbumListingModel.Request) {
        
    }
}
