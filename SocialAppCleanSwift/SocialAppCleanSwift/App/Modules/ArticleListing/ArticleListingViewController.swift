//
//  ArticleListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 06.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IArticleListingViewController: class {
	// do someting...
    func displayFetchedArticles(viewModel: ArticleListingModel.ViewModel)
    func displayNoContentScreen()
}

class ArticleListingViewController: UIViewController {
	var interactor: IArticleListingInteractor!
	var router: IArticleListingRouter!
    
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
        fetchArticles()
    }
    
    // MARK: - Fetch posts
    
    var displayedArticles: [ArticleListingModel.ViewModel.DisplayedArticle] = []
    
    func fetchArticles()
    {
        let request = ArticleListingModel.Request()
        interactor?.fetchArticles(request: request)
    }
}

extension ArticleListingViewController: IArticleListingViewController {
    func displayNoContentScreen() {
        tableView.setEmptyView(title: "There are no articles.", message: "Please retry later.")
    }
    
    func displayFetchedArticles(viewModel: ArticleListingModel.ViewModel) {
        displayedArticles = viewModel.displayedArticles
        tableView.reloadData()
    }
    
	// do someting...
}

extension ArticleListingViewController {
	// do someting...
    func setupViews() {
        //view.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(ArticleViewCell.self, forCellReuseIdentifier: ArticleViewCell.identifier)
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

extension ArticleListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.navigateToArticleDetail(for: self.displayedArticles[indexPath.row].title, url: self.displayedArticles[indexPath.row].url)
    }
}

extension ArticleListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleViewCell.identifier, for: indexPath) as! ArticleViewCell
        //cell.textLabel?.text = self.displayedPosts[indexPath.row].title
        cell.item = self.displayedArticles[indexPath.row]
        return cell
    }
}

extension ArticleListingViewController {
	// do someting...
}
