//
//  DetailViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

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
