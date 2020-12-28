//
//  ReminderListingViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 08.12.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IReminderListingViewController: class {
    func displayFetchedReminders(viewModel: ReminderListingModel.ViewModel)
}

class ReminderListingViewController: UIViewController {
	var interactor: IReminderListingInteractor!
	var router: IReminderListingRouter!

    let tableView = UITableView()
    
	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchReminders()
    }
    
    // MARK: - Fetch reminders
    
    var displayedReminders: [ReminderListingModel.ViewModel.DisplayedReminder] = []
    
    func fetchReminders()
    {
        let request = ReminderListingModel.Request()
        interactor?.fetchReminders(request: request)
    }
}

extension ReminderListingViewController: IReminderListingViewController {
    func displayFetchedReminders(viewModel: ReminderListingModel.ViewModel) {
        displayedReminders = viewModel.displayedReminders
        tableView.reloadData()
    }
    
	// do someting...
}

extension ReminderListingViewController {
    func setupViews() {
        //view.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(ReminderViewCell.self, forCellReuseIdentifier: ReminderViewCell.identifier)
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

extension ReminderListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //router.navigateToTodos(for: self.displayedTodos[indexPath.row].id)
    }
}

extension ReminderListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedReminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReminderViewCell.identifier, for: indexPath) as! ReminderViewCell
        cell.item = self.displayedReminders[indexPath.row]
        return cell
    }
}
