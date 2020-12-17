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
    
    private let textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textView.placeholder = "createpost_posttext_placeholder".localized
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension CreatePostViewController: ICreatePostViewController {
	// do someting...
}

extension CreatePostViewController {
	// do someting...
    func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "createpost_postbutton_title".localized, style: .plain, target: self, action: #selector(sendPost))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        view.addSubview(headerView)
        view.addSubview(textView)
        textView.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textViewDidChange),
                                               name: UITextView.textDidChangeNotification,
                                               object: nil)
    }
    
    func setupConstraints() {
        let margin: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 92),
            headerView.heightAnchor.constraint(equalToConstant: 75),
            headerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            textView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: margin),
            textView.heightAnchor.constraint(equalToConstant: 150),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0)
        ])
    }
    
    @objc func sendPost() {
        //router.navigateToCreatePost()
    }
}

extension CreatePostViewController: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        if let text = self.textView.text{
            navigationItem.rightBarButtonItem?.isEnabled = !text.isEmpty
        }
    }
}
