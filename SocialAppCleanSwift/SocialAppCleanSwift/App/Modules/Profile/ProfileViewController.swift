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

    private let photoImageView: CachedImageView = {
        let view = CachedImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "profile_name_placeholder".localized
        return view
    }()
    
    let usernameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "profile_username_placeholder".localized
        return view
    }()
    
    let emailLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "profile_email_placeholder".localized
        return view
    }()
    
    let streetLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "profile_street_placeholder".localized
        return view
    }()
    
    let cityPlusZipLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "profile_cityzip_placeholder".localized
        return view
    }()
    
    let phoneLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "profile_phone_placeholder".localized
        return view
    }()
    
    let locationButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        view.setTitle("profile_location_button".localized, for: .normal)
        return view
    }()
    
    let albumsButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        view.setTitle("profile_albums_button".localized, for: .normal)
        return view
    }()
    
    let todosButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cyan
        view.setTitle("profile_todos_button".localized, for: .normal)
        return view
    }()
    
    let articlesButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        view.setTitle("profile_articles_button".localized, for: .normal)
        return view
    }()
    
    let remindersButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.setTitle("profile_reminders_button".localized, for: .normal)
        return view
    }()
    
    let marketplaceButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.setTitle("profile_marketplace_button".localized, for: .normal)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        view.addSubview(photoImageView)
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(streetLabel)
        view.addSubview(cityPlusZipLabel)
        view.addSubview(phoneLabel)
        view.addSubview(locationButton)
        view.addSubview(albumsButton)
        view.addSubview(todosButton)
        view.addSubview(articlesButton)
        view.addSubview(remindersButton)
        view.addSubview(marketplaceButton)
        
        locationButton.addTarget(self, action: #selector(navigateToShowLocation(_:)), for: .touchUpInside)
        
        albumsButton.addTarget(self, action: #selector(navigateToAlbumListing(_:)), for: .touchUpInside)
        
        todosButton.addTarget(self, action: #selector(navigateToTodoListing(_:)), for: .touchUpInside)
        
        articlesButton.addTarget(self, action: #selector(navigateToArticleListing(_:)), for: .touchUpInside)
        
        remindersButton.addTarget(self, action: #selector(navigateToReminderListing(_:)), for: .touchUpInside)
        
        marketplaceButton.addTarget(self, action: #selector(navigateToMarketplace(_:)), for: .touchUpInside)
        
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
    
    @objc func navigateToArticleListing(_ sender: UIButton) {
        router.navigateToArticleListing()
    }
    
    @objc func navigateToReminderListing(_ sender: UIButton) {
        router.navigateToReminderListing()
    }
    
    @objc func navigateToMarketplace(_ sender: UIButton) {
        router.navigateToMarketplace()
    }
    
    private func setupConstraints() {
        
        let margin: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor, constant: 0),
            photoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            photoImageView.heightAnchor.constraint(equalToConstant: 155),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: margin), //TODO: use safe top anchor
            nameLabel.centerXAnchor
                .constraint(equalTo: view.centerXAnchor, constant: 0),
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
        
        NSLayoutConstraint.activate([
            articlesButton.topAnchor.constraint(equalTo: todosButton.bottomAnchor, constant: margin),
            articlesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            articlesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            articlesButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            remindersButton.topAnchor.constraint(equalTo: articlesButton.bottomAnchor, constant: margin),
            remindersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            remindersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            remindersButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            marketplaceButton.topAnchor.constraint(equalTo: remindersButton.bottomAnchor, constant: margin),
            marketplaceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            marketplaceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            marketplaceButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        photoImageView.maskCircle()
    }
}

extension ProfileViewController: IProfileViewController {
    // do someting...
    func displayUserProfile(viewModel: ProfileModel.ViewModel) {
        
        if let photoUrl = viewModel.displayedUser.avatarURL {
            photoImageView.load(url: photoUrl)
        }
        
        nameLabel.text = viewModel.displayedUser.name
        usernameLabel.text = "profile_username_label".localized + viewModel.displayedUser.username
        emailLabel.text = "profile_email_label".localized + viewModel.displayedUser.email
        streetLabel.text = "profile_street_label".localized + viewModel.displayedUser.street
        cityPlusZipLabel.text = "profile_city_label".localized + viewModel.displayedUser.city + "profile_zip_label".localized + viewModel.displayedUser.zipcode
        phoneLabel.text = "profile_phone_label".localized + viewModel.displayedUser.phone
    }
}

extension ProfileViewController {
    // do someting...
}

extension ProfileViewController {
    // do someting...
}
