//
//  SellItemViewCell.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 28.12.20.
//

import UIKit

class SellItemViewCell: UICollectionViewCell {
    
    let imageView: CachedImageView = {
        let view = CachedImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textAlignment = .left
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
    
    func set(viewModel: SellItemListingModel.ViewModel.DisplayedSellItem) {
        titleLabel.text = viewModel.title
        guard let image = viewModel.image, let url = URL(string: image) else { return }
        imageView.load(url: url)
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
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5)
        ])
    }
    
}
