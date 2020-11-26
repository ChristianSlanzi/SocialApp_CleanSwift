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
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "HOME"
        return view
    }()
    
    let settingsButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("GO TO SETTING", for: .normal)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        view.backgroundColor = .lightGray
        view.addSubview(titleLabel)
        view.addSubview(settingsButton)
        
        setupConstraints()
        
        settingsButton.addTarget(self, action: #selector(navigateToSettings(_:)), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
        
    }
    
    @objc func navigateToSettings(_ sender: UIButton) {
        let name = "Settings Page Title passed as parameter"
        router.navigateToSettings(title: name)
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
