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
    case discover
    case profile
    case detail
    case settings
    case contacts
    case showLocation
    case postListing
    case commentListing
    case albumListing
    case photoListing
    case todoListing
    case articleListing
    case sellItemListing
    case articleDetail
    case reminderListing
    case createPost
    case story
    case watchListing
}

private extension GeneralRouter {
    
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
    func mappingContacts(value: IAppRouter) -> IModule {
        return ContactsModule(value)
    }
    func mappingShowLocation(value: IAppRouter) -> IModule {
        return ShowLocationModule(value)
    }
    func mappingPostListing(value: IAppRouter) -> IModule {
        return PostListingModule(value)
    }
    func mappingCommentListing(value: IAppRouter) -> IModule {
        return CommentListingModule(value)
    }
    func mappingAlbumListing(value: IAppRouter) -> IModule {
        return AlbumListingModule(value)
    }
    func mappingPhotoListing(value: IAppRouter) -> IModule {
        return PhotoListingModule(value)
    }
    func mappingTodoListing(value: IAppRouter) -> IModule {
        return TodoListingModule(value)
    }
    func mappingArticleListing(value: IAppRouter) -> IModule {
        return ArticleListingModule(value)
    }
    func mappingSellItemListing(value: IAppRouter) -> IModule {
        return SellItemListingModule(value)
    }
    func mappingArticleDetail(value: IAppRouter) -> IModule {
        return ArticleDetailModule(value)
    }
    func mappingReminderListing(value: IAppRouter) -> IModule {
        return ReminderListingModule(value)
    }
    func mappingDiscover(value: IAppRouter) -> IModule {
        return DiscoverModule(value)
    }
    func mappingCreatePost(value: IAppRouter) -> IModule {
        return CreatePostModule(value)
    }
    func mappingStory(value: IAppRouter) -> IModule {
        return StoryModule(value)
    }
    func mappingWatchListing(value: IAppRouter) -> IModule {
        return WatchListingModule(value)
    }
}

extension GeneralRouter {
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
        case .contacts:
            return mappingContacts
        case .showLocation:
            return mappingShowLocation
        case .postListing:
            return mappingPostListing
        case .commentListing:
            return mappingCommentListing
        case .albumListing:
            return mappingAlbumListing
        case .photoListing:
            return mappingPhotoListing
        case .todoListing:
            return mappingTodoListing
        case .articleListing:
            return mappingArticleListing
        case .sellItemListing:
            return mappingSellItemListing
        case .articleDetail:
            return mappingArticleDetail
        case .reminderListing:
            return mappingReminderListing
        case .discover:
            return mappingDiscover
        case .createPost:
            return mappingCreatePost
        case .story:
            return mappingStory
        case .watchListing:
            return mappingWatchListing
        }
    }
    
    var module: Module {
        let appRouter = AppRouter.share
        return imodule(appRouter) as! Module
    }
    
}
