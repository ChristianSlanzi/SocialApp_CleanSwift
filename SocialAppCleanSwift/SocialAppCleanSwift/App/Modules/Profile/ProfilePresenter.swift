//
//  ProfilePresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfilePresenter: class {
	// do someting...
    func presentUserProfile(response: ProfileModel.Response)
}

class ProfilePresenter: IProfilePresenter {	
	weak var view: IProfileViewController!
	
	init(view: IProfileViewController) {
		self.view = view
	}
}

extension ProfilePresenter {
    func presentUserProfile(response: ProfileModel.Response) {
        let user = response.user
        let displayedUser = ProfileModel.ViewModel.DisplayedUser(name: user.name,
                                                                 username: user.username!,
                                                                 email: user.email!,
                                                                 street: user.address!.street!,
                                                                 city: user.address!.city!,
                                                                 zipcode: user.address!.zipcode!,
                                                                 phone: user.phone!)
        let viewModel = ProfileModel.ViewModel(displayedUser: displayedUser)
        view.displayUserProfile(viewModel: viewModel)
    }
}
