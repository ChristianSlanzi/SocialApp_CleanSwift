//
//  LoginViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

import UIKit

protocol ILoginViewController: class {
    // do someting...
}

class LoginViewController: UIViewController {
    var interactor: ILoginInteractor!
    var router: ILoginRouter!
    
    let loginLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "LOGIN"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        view.backgroundColor = .lightGray
        view.addSubview(loginLabel)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}

extension LoginViewController: ILoginViewController {
    // do someting...
}

extension LoginViewController {
    // do someting...
}

extension LoginViewController {
    // do someting...
}
