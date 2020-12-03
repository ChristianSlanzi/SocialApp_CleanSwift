//
//  ProfileViewController.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 26.11.20.
//

import UIKit

protocol IProfileViewController: class {
    // do someting...
    func displayUserProfile(viewModel: ProfileModel.ViewModel)
}

class ProfileViewController: UIViewController {
    var interactor: ShowContactBusinessLogic!
    var router: IProfileRouter!
    
    let margin: CGFloat = 20

    let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "NAME"
        return view
    }()
    
    let usernameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "USERNAME"
        return view
    }()
    
    let emailLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "EMAIL"
        return view
    }()
    
    let streetLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "STREET"
        return view
    }()
    
    let cityPlusZipLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "CITY+ZIP"
        return view
    }()
    
    let phoneLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "PHONE"
        return view
    }()
    
    let locationButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        view.setTitle("SHOW LOCATION", for: .normal)
        return view
    }()
    
    let albumsButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        view.setTitle("SHOW ALBUMS", for: .normal)
        return view
    }()
    
    let todosButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        view.setTitle("SHOW TODOS", for: .normal)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(streetLabel)
        view.addSubview(cityPlusZipLabel)
        view.addSubview(phoneLabel)
        view.addSubview(locationButton)
        view.addSubview(albumsButton)
        view.addSubview(todosButton)
        
        locationButton.addTarget(self, action: #selector(navigateToShowLocation(_:)), for: .touchUpInside)
        
        albumsButton.addTarget(self, action: #selector(navigateToAlbumListing(_:)), for: .touchUpInside)
        
        todosButton.addTarget(self, action: #selector(navigateToTodoListing(_:)), for: .touchUpInside)
        
        setupConstraints()
        interactor.getUser(request: ProfileModel.Request())
    }
    
    @objc func navigateToShowLocation(_ sender: UIButton) {
        router.navigateToShowLocation()
    }
    
    @objc func navigateToAlbumListing(_ sender: UIButton) {
        router.navigateToAlbumListing()
    }
    
    @objc func navigateToTodoListing(_ sender: UIButton) {
        router.navigateToTodoListing()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120), //TODO: use safe top anchor
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: margin),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            usernameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: margin),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            emailLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            streetLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: margin),
            streetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            streetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            streetLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            cityPlusZipLabel.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: margin),
            cityPlusZipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            cityPlusZipLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            cityPlusZipLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: cityPlusZipLabel.bottomAnchor, constant: margin),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            phoneLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            phoneLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: margin),
            locationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            locationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            locationButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            albumsButton.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: margin),
            albumsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            albumsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            albumsButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            todosButton.topAnchor.constraint(equalTo: albumsButton.bottomAnchor, constant: margin),
            todosButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            todosButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            todosButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension ProfileViewController: IProfileViewController {
    // do someting...
    func displayUserProfile(viewModel: ProfileModel.ViewModel) {
        nameLabel.text = "Name: " + viewModel.displayedUser.name
        usernameLabel.text = "Username: " + viewModel.displayedUser.username
        emailLabel.text = "E-mail: " + viewModel.displayedUser.email
        streetLabel.text = "Street: " + viewModel.displayedUser.street
        cityPlusZipLabel.text = "City: " + viewModel.displayedUser.city + " , Zip: " + viewModel.displayedUser.zipcode
        phoneLabel.text = "Phone: " + viewModel.displayedUser.phone
    }
}

extension ProfileViewController {
    // do someting...
}

extension ProfileViewController {
    // do someting...
}
