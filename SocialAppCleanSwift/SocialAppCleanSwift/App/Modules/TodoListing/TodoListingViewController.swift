//
//  TodoListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol ITodoListingViewController: class {
	// do someting...
    func displayFetchedTodos(viewModel: TodoListingModel.ViewModel)
}

class TodoListingViewController: UIViewController {
	var interactor: ITodoListingInteractor!
	var router: ITodoListingRouter!
    
    let tableView = UITableView()

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTodos()
    }
    
    // MARK: - Fetch posts
    
    var displayedTodos: [TodoListingModel.ViewModel.DisplayedTodo] = []
    
    func fetchTodos()
    {
        let request = TodoListingModel.Request()
        interactor?.fetchTodos(request: request)
    }
}

extension TodoListingViewController: ITodoListingViewController {
    func displayFetchedTodos(viewModel: TodoListingModel.ViewModel) {
        displayedTodos = viewModel.displayedTodos
        tableView.reloadData()
    }
    
	// do someting...
}

extension TodoListingViewController {
	// do someting...
    func setupViews() {
        //view.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(TodoViewCell.self, forCellReuseIdentifier: TodoViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ]
        )
    }
}

extension TodoListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //router.navigateToTodos(for: self.displayedTodos[indexPath.row].id)
    }
}

extension TodoListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedTodos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoViewCell.identifier, for: indexPath) as! TodoViewCell
        cell.delegate = self
        cell.item = self.displayedTodos[indexPath.row]
        return cell
    }
}

extension TodoListingViewController: TodoViewCellDelegate {
	// do someting...
    func updateTodo(todo: TodoListingModel.ViewModel.DisplayedTodo) {
        var request = TodoListingModel.Request()
        request.parameters = ["id": todo.id, "name": todo.name, "completed": todo.completed]
        interactor?.updateTodo(request: request)
    }
}
