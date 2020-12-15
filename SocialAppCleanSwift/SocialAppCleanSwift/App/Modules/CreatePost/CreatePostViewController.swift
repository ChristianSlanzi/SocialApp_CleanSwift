//
//  CreatePostViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ICreatePostViewController: class {
	// do someting...
}

class CreatePostViewController: UIViewController {
	var interactor: ICreatePostInteractor!
	var router: ICreatePostRouter!
    
    private let headerView: UserHeaderView = {
        let view = UserHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        setupViews()
        setupConstraints()
    }
}

extension CreatePostViewController: ICreatePostViewController {
	// do someting...
}

extension CreatePostViewController {
	// do someting...
    func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(sendPost))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        view.addSubview(headerView)
    }
    
    func setupConstraints() {
        let margin: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            headerView.heightAnchor.constraint(equalToConstant: 75),
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
    }
    
    @objc func sendPost() {
        //router.navigateToCreatePost()
    }
}

extension CreatePostViewController {
	// do someting...
}
