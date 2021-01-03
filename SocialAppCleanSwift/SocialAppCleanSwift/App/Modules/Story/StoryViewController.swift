//
//  StoryViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IStoryViewController: class {
    func displayStory(_ displayedStory: StoryModel.ViewModel.DisplayedStory)
    func moveToNextPage()
}

class StoryViewController: UIViewController {
	var interactor: IStoryInteractor!
	var router: IStoryRouter!
    
    let imageView: CachedImageView = {
        let view = CachedImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    var displayedStory: StoryModel.ViewModel.DisplayedStory!

	override func viewDidLoad() {
        super.viewDidLoad()
		
        setupViews()
        setupConstraints()
        setupBehaviours()
        setupActions()
        interactor.getStory(request: StoryModel.Request())
    }
}

extension StoryViewController: IStoryViewController {
    
    //TODO: move logic to the interactor... 
    func moveToNextPage() {
        self.displayedStory.currentPage = self.displayedStory.currentPage + 1
        if self.displayedStory.currentPage >= self.displayedStory.photoUrls.count {
            self.displayedStory.currentPage = 0
        }
        self.showCurrentPage()
    }
    
    func displayStory(_ displayedStory: StoryModel.ViewModel.DisplayedStory) {
        self.displayedStory = displayedStory
        self.showCurrentPage()
    }
    
}

extension StoryViewController {
    func setupViews() {
        view.backgroundColor = .black
        view.addSubview(imageView)
    }
    
    func setupConstraints() {
        //let margin: CGFloat = 8.0
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            imageView.rightAnchor
                .constraint(equalTo: view.rightAnchor, constant: 0.0),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    func setupBehaviours() {
        
    }
    func setupActions() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        // we should call an action on the interactor
        interactor.moveToNextPage()
    }
    
    func showCurrentPage() {
        let page = self.displayedStory.currentPage
        if page < self.displayedStory.photoUrls.count {
            let pageUrl = self.displayedStory.photoUrls[page]
            imageView.load(url: pageUrl)
        }
    }
}

extension StoryViewController {
	// do someting...
}
