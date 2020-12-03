//
//  AlbumListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IAlbumListingViewController: class {
	// do someting...
    func displayFetchedAlbums(viewModel: AlbumListingModel.ViewModel)
}

class AlbumListingViewController: UIViewController {
	var interactor: IAlbumListingInteractor!
	var router: IAlbumListingRouter!

    let tableView = UITableView()
    
	override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        fetchAlbums()
    }
    
    // MARK: - Fetch posts
    
    var displayedAlbums: [AlbumListingModel.ViewModel.DisplayedAlbum] = []
    
    func fetchAlbums()
    {
        let request = AlbumListingModel.Request()
        interactor?.fetchAlbums(request: request)
    }
}

extension AlbumListingViewController: IAlbumListingViewController {
    func displayFetchedAlbums(viewModel: AlbumListingModel.ViewModel) {
        displayedAlbums = viewModel.displayedAlbums
        tableView.reloadData()
    }
    
    // do someting...
}

extension AlbumListingViewController {
    // do someting...
    func setupViews() {
        //view.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(AlbumViewCell.self, forCellReuseIdentifier: AlbumViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ]
        )
    }
}

extension AlbumListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AlbumListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumViewCell.identifier, for: indexPath) as! AlbumViewCell
        //cell.textLabel?.text = self.displayedPosts[indexPath.row].title
        cell.item = self.displayedAlbums[indexPath.row]
        return cell
    }
}

extension AlbumListingViewController {
    // do someting...
}
