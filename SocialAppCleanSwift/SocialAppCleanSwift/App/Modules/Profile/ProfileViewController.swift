//
//  ProfileViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfileViewController: class {
    // do someting...
    func displayUserProfile(viewModel: ProfileModel.ViewModel)
}

class ProfileViewController: UIViewController {
    var interactor: ShowContactBusinessLogic!
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
        interactor.getUser(request: ProfileModel.Request())
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
    func displayUserProfile(viewModel: ProfileModel.ViewModel) {
        titleLabel.text = viewModel.displayedUser.name
    }
}

extension ProfileViewController {
    // do someting...
}

extension ProfileViewController {
    // do someting...
}
