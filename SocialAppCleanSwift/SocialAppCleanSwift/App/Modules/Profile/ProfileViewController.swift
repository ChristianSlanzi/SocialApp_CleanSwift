//
//  ProfileViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 ARI MUNANDAR. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar
//              * https://www.youtube.com/channel/UC7jr8DR06tcVR0QKKl6cSNA?view_as=subscriber

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
