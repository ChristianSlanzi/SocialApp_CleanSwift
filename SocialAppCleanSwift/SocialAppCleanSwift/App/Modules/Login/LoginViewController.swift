//
//  LoginViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

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
        view.text = "login_view_label".localized
        return view
    }()
    
    let loginButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("login_home_button".localized, for: .normal)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        view.backgroundColor = .lightGray
        view.addSubview(loginLabel)
        view.addSubview(loginButton)
        
        setupConstraints()
        
        loginButton.addTarget(self, action: #selector(navigateToHome(_:)), for: .touchUpInside)
    }
    
    @objc func navigateToHome(_ sender: UIButton) {
        router.navigateToHome()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20)
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
