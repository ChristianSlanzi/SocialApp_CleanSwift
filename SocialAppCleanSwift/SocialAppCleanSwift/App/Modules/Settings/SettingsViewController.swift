//
//  SettingsViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ISettingsViewController: class {
	// do someting...
}

class SettingsViewController: UIViewController {
	var interactor: ISettingsInteractor!
	var router: ISettingsRouter!

    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = ""
        view.textColor = .blue
        return view
    }()
    
	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        view.addSubview(titleLabel)
        titleLabel.text = interactor.parameters?["title"] as? String
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension SettingsViewController: ISettingsViewController {
	// do someting...
}

extension SettingsViewController {
	// do someting...
}

extension SettingsViewController {
	// do someting...
}
