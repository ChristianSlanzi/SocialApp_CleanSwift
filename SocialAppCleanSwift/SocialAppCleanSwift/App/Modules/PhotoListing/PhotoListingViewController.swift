//
//  PhotoListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPhotoListingViewController: class {
	// do someting...
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
    
    
}

extension PhotoListingViewController: IPhotoListingViewController {
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
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoViewCell.identifier, for: indexPath) as! PhotoViewCell
        //cell.set(viewModel: viewModel.getFollower(indexPath))
        return cell
    }
    

}
