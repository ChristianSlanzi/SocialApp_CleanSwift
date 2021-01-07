//
//  ChatViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 07.01.21.
//  Copyright (c) 2021 Christian Slanzi. All rights reserved.

import UIKit

protocol IChatViewController: class {
	// do someting...
}

class ChatViewController: UIViewController {
	var interactor: IChatInteractor!
	var router: IChatRouter!
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "chat_view_message".localized
        return view
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension ChatViewController: IChatViewController {
	// do someting...
}

extension ChatViewController {
	// do someting...
}

extension ChatViewController {
	// do someting...
}
