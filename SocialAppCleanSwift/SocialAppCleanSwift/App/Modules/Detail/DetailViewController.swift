//
//  DetailViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IDetailViewController: class {
    // do someting...
}

class DetailViewController: UIViewController {
    var interactor: IDetailInteractor!
    var router: IDetailRouter!

    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "DETAIL"
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

extension DetailViewController: IDetailViewController {
    // do someting...
}

extension DetailViewController {
    // do someting...
}

extension DetailViewController {
    // do someting...
}
