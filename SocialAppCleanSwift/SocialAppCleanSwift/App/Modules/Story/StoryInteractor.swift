//
//  StoryInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

protocol IStoryInteractor: class {
	var parameters: [String: Any]? { get }
    
    func getStory(request: StoryModel.Request)
    func moveToNextPage()
}

protocol StoryDataStore
{
  var story: Story! { get set }
}

class StoryInteractor: IStoryInteractor, StoryDataStore {
    var presenter: IStoryPresenter!
    var parameters: [String: Any]?
    
    var story: Story!

    private var manager: IStoryManager {
        return StoryManager()
    }

    init(presenter: IStoryPresenter) {
    	self.presenter = presenter
    }
}

extension StoryInteractor {
    func getStory(request: StoryModel.Request) {
        if story != nil {
            let response = StoryModel.Response(story: story)
            presenter.presentStory(response: response)
        }
    }
    
    func moveToNextPage() {
        presenter.moveToNextPage()
    }
}
