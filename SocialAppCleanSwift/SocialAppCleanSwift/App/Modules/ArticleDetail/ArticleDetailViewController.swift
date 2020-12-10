//
//  ArticleDetailViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit
import WebKit

protocol IArticleDetailViewController: class {
	// do someting...
}

class ArticleDetailViewController: UIViewController {
	var interactor: IArticleDetailInteractor!
	var router: IArticleDetailRouter!
    
    let webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: webConfiguration)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        setupViews()
        setupConstraints()
        
        if let urlString = interactor.parameters?["url"] as? String, let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
}

extension ArticleDetailViewController: IArticleDetailViewController {
	// do someting...
}

extension ArticleDetailViewController {
	// do someting...
    func setupViews() {
        self.view.addSubview(webView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ArticleDetailViewController {
	// do someting...
}
