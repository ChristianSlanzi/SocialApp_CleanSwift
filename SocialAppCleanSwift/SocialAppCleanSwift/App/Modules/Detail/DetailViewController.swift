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

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
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
