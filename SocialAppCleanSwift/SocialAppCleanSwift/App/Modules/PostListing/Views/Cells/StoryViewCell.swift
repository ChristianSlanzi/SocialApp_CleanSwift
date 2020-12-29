//
//  StoryCellView.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 29.12.20.
//

import UIKit

class StoryViewCell: UICollectionViewCell {
    
    let imageView: CachedImageView = {
        let view = CachedImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
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
    
    func set(viewModel: StoryListingModel.ViewModel.DisplayedStory) {
        titleLabel.text = viewModel.title
        //guard  let url = URL(string: viewModel.photoUrl.first!) else { return }
        //imageView.load(url: url)
    }
    
    // MARK: - Layout Methods

    private func configure() {
        backgroundColor = .lightGray
        //backgroundColor = .random()
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        let margin: CGFloat = 8.0
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: margin)
        ])
    }
    
}
