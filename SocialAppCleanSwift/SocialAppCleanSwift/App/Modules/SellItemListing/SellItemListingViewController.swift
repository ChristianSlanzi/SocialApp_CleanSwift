//
//  SellItemListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISellItemListingViewController: class {
	// do someting...
    func displayFetchedItems(viewModel: SellItemListingModel.ViewModel)
}

class SellItemListingViewController: UIViewController {
	var interactor: ISellItemListingInteractor!
	var router: ISellItemListingRouter!

    var collectionView: UICollectionView!
    
	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        fetchItems()
    }
    
    // MARK: - Fetch items
    
    var displayedItems: [SellItemListingModel.ViewModel.DisplayedSellItem] = []
    
    func fetchItems()
    {
        let request = SellItemListingModel.Request()
        interactor?.fetchSellItems(request: request)
    }
}

extension SellItemListingViewController: ISellItemListingViewController {
    func displayFetchedItems(viewModel: SellItemListingModel.ViewModel) {
        displayedItems = viewModel.displayedItems
        collectionView.reloadData()
    }
    
	// do someting...
}

extension SellItemListingViewController {
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: CollectionViewHelper.createColumnedFlowLayout(in: view, numberOfColums: 2, itemHeight: 200)
        )
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SellItemViewCell.self, forCellWithReuseIdentifier: SellItemViewCell.identifier)
    }
}

// MARK: - Extensions (Delegation Conformance)

/// UICollectionViewDelegate Conformance
extension SellItemListingViewController: UICollectionViewDelegate {

}

/// UICollectionViewDataSource Conformance
extension SellItemListingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        displayedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SellItemViewCell.identifier, for: indexPath) as! SellItemViewCell
        cell.set(viewModel: displayedItems[indexPath.row])
        return cell
    }
    

}
