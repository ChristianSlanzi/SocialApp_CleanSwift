//
//  StoryPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IStoryPresenter: class {
    func presentStory(response: StoryModel.Response)
    func moveToPage(page: Int)
}

class StoryPresenter: IStoryPresenter {
	weak var view: IStoryViewController!
    var displayedStory: StoryModel.ViewModel.DisplayedStory?
	
	init(view: IStoryViewController) {
		self.view = view
	}
    
    func presentStory(response: StoryModel.Response) {
        let story = response.story
        displayedStory = StoryModel.ViewModel.DisplayedStory(id: story.id, title: story.title, photoUrls: story.pages.compactMap({URL(string: $0)}), currentPage: 0)
        self.view.displayStory(displayedStory!)
    }
    
    func moveToPage(page: Int) {
        if displayedStory != nil {
            displayedStory!.currentPage = page
        }
        self.view.displayStory(displayedStory!)
    }
}
