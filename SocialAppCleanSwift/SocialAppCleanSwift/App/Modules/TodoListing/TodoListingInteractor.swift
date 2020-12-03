//
//  TodoListingInteractor.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ITodoListingInteractor: class {
	var parameters: [String: Any]? { get }
    
    func fetchTodos(request: TodoListingModel.Request)
}

class TodoListingInteractor: ITodoListingInteractor {
    var presenter: ITodoListingPresenter!
    var parameters: [String: Any]?

    private var manager: ITodoListingManager {
        return TodoListingManager()
    }

    init(presenter: ITodoListingPresenter) {
    	self.presenter = presenter
    }
}

extension TodoListingInteractor {
    func fetchTodos(request: TodoListingModel.Request) {
        guard let userId = parameters?["userId"] as? Int else { return }
        Current.networkingService.retrieveTodos(for: userId) { (result) in
            switch(result) {
            case .success(let todos):
                let response = TodoListingModel.Response(todos: todos)
                self.presenter.presentFetchedTodos(response: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
