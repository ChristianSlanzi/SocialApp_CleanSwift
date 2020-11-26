//
//  HomeViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

import UIKit

protocol IHomeViewController: class {
    // do someting...
}

class HomeViewController: UIViewController {
    var interactor: IHomeInteractor!
    var router: IHomeRouter!
    
    let loginLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "HOME"
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

extension HomeViewController: IHomeViewController {
    // do someting...
}

extension HomeViewController {
    // do someting...
}

extension HomeViewController {
    // do someting...
}
