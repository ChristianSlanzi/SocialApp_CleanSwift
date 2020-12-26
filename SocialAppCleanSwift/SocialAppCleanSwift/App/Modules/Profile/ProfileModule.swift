//
//  ProfileModule.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

class ProfileModule: IModule, ShowContactDataStore {
    
    let appRouter: IAppRouter
    private var router: ProfileRouter!
    var user: User!

    init(_ appRouter: IAppRouter) {
        self.appRouter = appRouter
        self.router = ProfileRouter(appRouter: self.appRouter)
    }

    func presentView(parameters: [String: Any]) {
        router.dataStore = self
        router.presentView(parameters: parameters)
    }

    func createView(parameters: [String: Any]) -> UIViewController? {
        return router.create(parameters: parameters)
    }
}

extension ProfileModule: Module {
    var routePath: String {
        return "Profile"
    }
}
