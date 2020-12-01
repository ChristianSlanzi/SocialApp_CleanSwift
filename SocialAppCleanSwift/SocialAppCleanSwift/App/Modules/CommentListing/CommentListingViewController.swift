//
//  CommentListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICommentListingViewController: class {
	// do someting...
    func displayFetchedComments(viewModel: CommentListingModel.ViewModel)
}

class CommentListingViewController: UIViewController {
	var interactor: ICommentListingInteractor!
	var router: ICommentListingRouter!
    
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
        fetchComments()
    }
    
    // MARK: - Fetch posts
    
    var displayedComments: [CommentListingModel.ViewModel.DisplayedComment] = []
    
    func fetchComments()
    {
      let request = CommentListingModel.Request()
      interactor?.fetchComments(request: request)
    }
}

extension CommentListingViewController: ICommentListingViewController {
    func displayFetchedComments(viewModel: CommentListingModel.ViewModel) {
        
    }
    
	// do someting...
}

extension CommentListingViewController {
	// do someting...
    func setupViews() {
        //view.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(PostViewCell.self, forCellReuseIdentifier: CommentViewCell.identifier)
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

extension CommentListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension CommentListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentViewCell.identifier, for: indexPath) as! CommentViewCell
        //cell.textLabel?.text = self.displayedPosts[indexPath.row].title
        cell.item = self.displayedComments[indexPath.row]
        return cell
    }
}

extension CommentListingViewController {
	// do someting...
}
