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

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
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
