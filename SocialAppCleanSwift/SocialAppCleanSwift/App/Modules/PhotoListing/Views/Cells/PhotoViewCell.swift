//
//  PhotoViewCell.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    
    let imageView: CachedImageView = {
        let view = CachedImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
   
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    /// init required by the API to support storyboards
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(viewModel: PhotoListingModel.ViewModel.DisplayedPhoto) {
        //usernameLabel.text = viewModel.login
        guard  let url = URL(string: viewModel.thumbnailUrl) else { return }
        imageView.load(url: url)
    }
    
    // MARK: - Layout Methods

    private func configure() {
        backgroundColor = .lightGray
        //backgroundColor = .random()
        
        contentView.addSubview(imageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
        ])
    }
    
}
