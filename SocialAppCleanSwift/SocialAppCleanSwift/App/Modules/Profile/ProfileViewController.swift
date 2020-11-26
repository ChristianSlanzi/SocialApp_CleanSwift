//
//  ProfileViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfileViewController: class {
    // do someting...
}

class ProfileViewController: UIViewController {
    var interactor: IProfileInteractor!
    var router: IProfileRouter!

    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "PROFILE"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        view.addSubview(titleLabel)
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension ProfileViewController: IProfileViewController {
    // do someting...
}

extension ProfileViewController {
    // do someting...
}

extension ProfileViewController {
    // do someting...
}
