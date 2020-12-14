//
//  PostListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IPostListingViewController: class {
	// do someting...
    func displayFetchedPosts(viewModel: PostListingModel.ViewModel)
}

class PostListingViewController: UIViewController {
	var interactor: IPostListingInteractor!
	var router: IPostListingRouter!

    let tableView = UITableView()
    
	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        view.backgroundColor = .blue
        
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
      super.viewWillAppear(animated)
      fetchPosts()
    }
    
    // MARK: - Fetch posts
    
    var displayedPosts: [PostListingModel.ViewModel.DisplayedPost] = []
    
    func fetchPosts()
    {
      let request = PostListingModel.Request()
      interactor?.fetchPosts(request: request)
    }
}

extension PostListingViewController: IPostListingViewController {
    func displayFetchedPosts(viewModel: PostListingModel.ViewModel) {
        displayedPosts = viewModel.displayedPosts
        tableView.reloadData()
    }
    
    // do someting...
}

extension PostListingViewController {
    // do someting...
    func setupViews() {
        //view.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 45
        tableView.register(PostViewCell.self, forCellReuseIdentifier: PostViewCell.identifier)
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

extension PostListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        router.navigateToComments(for: self.displayedPosts[indexPath.row].id)
    }
}

extension PostListingViewController: UITableViewDataSource {
    
    //func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //    return 155
    //}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostViewCell.identifier, for: indexPath) as! PostViewCell
        //cell.textLabel?.text = self.displayedPosts[indexPath.row].title
        //if(indexPath.row == 6 || indexPath.row == 5) {
        //    print("prr")
        //}
        cell.item = self.displayedPosts[indexPath.row]
        cell.layoutIfNeeded()
        return cell
    }
}

extension PostListingViewController {
	// do someting...
}

extension PostListingViewController {
	// do someting...
}
