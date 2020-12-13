//
//  ContactsViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//  Copyright (c) 2020 Christian Slanzi. All rights reserved.

import UIKit

protocol IContactsViewController: class {
    // do someting...
    func displayFetchedContacts(viewModel: ContactsModel.ViewModel)
}

class ContactsViewController: UIViewController {
    var interactor: IContactsInteractor!
    var router: IContactsRouter!
    
    let tableView = UITableView()
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        //view.backgroundColor = .yellow
        
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
      super.viewWillAppear(animated)
      fetchContacts()
    }
    
    // MARK: - Fetch contacts
    
    var displayedContacts: [ContactsModel.ViewModel.DisplayedContact] = []
    
    func fetchContacts()
    {
      let request = ContactsModel.Request()
      interactor?.fetchContacts(request: request)
    }
}

extension ContactsViewController: IContactsViewController {
    // do someting...
    func displayFetchedContacts(viewModel: ContactsModel.ViewModel)
    {
      displayedContacts = viewModel.displayedContacts
      tableView.reloadData()
    }
}

extension ContactsViewController {
    // do someting...
    func setupViews() {
        //view.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(ContactViewCell.self, forCellReuseIdentifier: ContactViewCell.identifier)
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

extension ContactsViewController {
    // do someting...
}


extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //TODO: either ask the interactor or the router to show the profile of the selected contact.
        //interactor.showContactProfile(contact: indexPath.row)
        //router.showContactProfile(contact: indexPath.row)
    
        // but interactor doesnt talk to the router...
        // in this case we want to route to another module.
        // so let's use the router directly
        router.navigateToProfile(for: self.displayedContacts[indexPath.row].id)
    }
}

extension ContactsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactViewCell.identifier, for: indexPath) as! ContactViewCell
        cell.item = self.displayedContacts[indexPath.row]
        return cell
    }
}
