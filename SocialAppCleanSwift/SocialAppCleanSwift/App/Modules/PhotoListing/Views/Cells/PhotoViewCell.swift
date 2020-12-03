//
//  PhotoViewCell.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
   
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    /// init required by the API to support storyboards
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Methods

    private func configure() {
        backgroundColor = .random()
    }
}
