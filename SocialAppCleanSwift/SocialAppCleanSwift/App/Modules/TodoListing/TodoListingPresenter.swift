//
//  TodoListingPresenter.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ITodoListingPresenter: class {
    // do someting...
    func presentFetchedTodos(response: TodoListingModel.Response)
}

class TodoListingPresenter: ITodoListingPresenter {
    weak var view: ITodoListingViewController!
    
    init(view: ITodoListingViewController) {
        self.view = view
    }
}

extension TodoListingPresenter {
    func presentFetchedTodos(response: TodoListingModel.Response) {
        let displayedTodos = response.todos.map({
            TodoListingModel.ViewModel.DisplayedTodo(id: $0.id, name: $0.title)
        })
        let viewModel = TodoListingModel.ViewModel(displayedTodos: displayedTodos)
        view.displayFetchedTodos(viewModel: viewModel)
    }
}
