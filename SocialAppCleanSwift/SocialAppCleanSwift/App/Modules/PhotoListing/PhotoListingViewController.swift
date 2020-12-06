//
//  PhotoListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPhotoListingViewController: class {
	// do someting...
    func displayFetchedPhotos(viewModel: PhotoListingModel.ViewModel)
}

class PhotoListingViewController: UIViewController {
	var interactor: IPhotoListingInteractor!
	var router: IPhotoListingRouter!
    
    var collectionView: UICollectionView!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        fetchPhotos()
    }
    
    // MARK: - Fetch posts
    
    var displayedPhotos: [PhotoListingModel.ViewModel.DisplayedPhoto] = []
    
    func fetchPhotos()
    {
        let request = PhotoListingModel.Request()
        interactor?.fetchPhotos(request: request)
    }
}

extension PhotoListingViewController: IPhotoListingViewController {
    func displayFetchedPhotos(viewModel: PhotoListingModel.ViewModel) {
        displayedPhotos = viewModel.displayedPhotos
        collectionView.reloadData()
    }
    
	// do someting...
}

extension PhotoListingViewController {
	// do someting...
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: CollectionViewHelper.createColumnedFlowLayout(in: view, numberOfColums: 2, itemHeight: 200)
        )
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(PhotoViewCell.self, forCellWithReuseIdentifier: PhotoViewCell.identifier)
    }
}

extension PhotoListingViewController {
	// do someting...
}

// MARK: - Extensions (Delegation Conformance)

/// UICollectionViewDelegate Conformance
extension PhotoListingViewController: UICollectionViewDelegate {

}

/// UICollectionViewDataSource Conformance
extension PhotoListingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        displayedPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoViewCell.identifier, for: indexPath) as! PhotoViewCell
        cell.set(viewModel: displayedPhotos[indexPath.row])
        return cell
    }
    

}
