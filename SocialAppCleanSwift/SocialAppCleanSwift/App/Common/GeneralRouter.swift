//
//  GeneralRouter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

enum GeneralRouter {
    case login
    case main
    case home
    case profile
    case detail
    case settings
}

extension GeneralRouter {
    
    func mappingLogin(value: IAppRouter) -> IModule {
        return LoginModule(value)
    }
    func mappingMain(value: IAppRouter) -> IModule {
        return MainModule(value)
    }
    func mappingHome(value: IAppRouter) -> IModule {
        return HomeModule(value)
    }
    func mappingProfile(value: IAppRouter) -> IModule {
        return ProfileModule(value)
    }
    func mappingDetail(value: IAppRouter) -> IModule {
        return DetailModule(value)
    }
    func mappingSettings(value: IAppRouter) -> IModule {
        return SettingsModule(value)
    }

    var imodule: (_ value: IAppRouter) -> IModule {
        
        switch self {
        case .login:
            return mappingLogin
        case .main:
            return mappingMain
        case .home:
            return mappingHome
        case .profile:
            return mappingProfile
        case .detail:
            return mappingDetail
        case .settings:
            return mappingSettings
        }
    }
    
    var module: Module {
        let appRouter = AppRouter.share
        return imodule(appRouter) as! Module
    }
    
}
