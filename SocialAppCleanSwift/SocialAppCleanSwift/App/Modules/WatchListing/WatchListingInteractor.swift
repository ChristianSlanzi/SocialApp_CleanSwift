//
//  WatchListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 07.01.21.
//

class WatchListingInteractor: PostListingInteractor {
    
    override func fetchPosts(request: PostListingModel.Request) {
        networkingService?.retrieveWatchPosts { (result) in
            switch(result) {
            case .success(let posts):
                self.posts = posts
                let response = PostListingModel.Response(posts: posts)
                self.presenter.presentFetchedPosts(response: response)
            case .failure(let error):
                //show failure message
                print(error)
                break
            }
        }
    }
    
    override func fetchStories(request: StoryListingModel.Request) {
        networkingService?.retrieveWatchStories { (result) in
            switch(result) {
            case .success(let stories):
                self.stories = stories
                let response = StoryListingModel.Response(stories: stories)
                self.presenter.presentFetchedStories(response: response)
            case .failure(let error):
                //show failure message
                print(error)
                break
            }
        }
    }
}
