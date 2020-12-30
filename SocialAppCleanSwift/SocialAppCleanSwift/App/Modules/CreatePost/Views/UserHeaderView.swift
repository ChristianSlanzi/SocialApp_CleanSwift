//
//  UserHeaderView.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//

import UIKit

class UserHeaderView: UIView {
    
    ///////////////////////////
    // user header
    private let photoImageView: CachedImageView = {
        let view = CachedImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "NAME"
        return view
    }()
    private let locationLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "LOCATION"
        return view
    }()
    ///////////////////////////
    
    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(photoImageView)
        addSubview(nameLabel)
        addSubview(locationLabel)
    }
    
    func setupConstraints() {
        let margin: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            photoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: margin),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            nameLabel.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: margin),
            locationLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            locationLabel.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 0)
        ])
    }
}
