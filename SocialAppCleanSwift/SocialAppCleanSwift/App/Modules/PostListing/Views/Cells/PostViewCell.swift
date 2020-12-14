//
//  PostViewCell.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//

import UIKit

class PostViewCell: UITableViewCell {
    
    private var photoHeightConstraint: NSLayoutConstraint?
    private var photoReducedHeightConstraint: NSLayoutConstraint?
    //private var photoHeightConstraint: NSLayoutConstraint?
    
    var item: PostListingModel.ViewModel.DisplayedPost? {
        didSet {
            if let item = item {
                updatedTimeLabel.text = item.updatedTime
                titleLabel.text = item.title
                bodyLabel.text = item.body
                if let photoUrl = item.photoUrl {
                    photoImageView.isHidden = false
                    //photoHeightConstraint?.isActive = true
                    photoImageView.load(url: photoUrl)
                    
                    photoHeightConstraint?.isActive = true
                    photoReducedHeightConstraint?.isActive = false

//                    let newConstraint = photoHeightConstraint!.constraintWithMultiplier(0.66)
//                    removeConstraint(photoHeightConstraint!)
//                    addConstraint(newConstraint)
//                    layoutIfNeeded()
//                    photoHeightConstraint = newConstraint
                } else {
                    photoImageView.isHidden = true

                    photoHeightConstraint?.isActive = false
                    photoReducedHeightConstraint?.isActive = true
/*
                    let newConstraint = photoHeightConstraint!.constraintWithMultiplier(0.0)
                    removeConstraint(photoHeightConstraint!)
                    addConstraint(newConstraint)
                    layoutIfNeeded()
                    photoHeightConstraint = newConstraint                    //photoHeightConstraint?.isActive = false
 */
                    
                }
                self.setNeedsLayout()
            }
        }
    }
    
    private let updatedTimeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .gray
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()

    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 22)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let bodyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let photoImageView: CachedImageView = {
        let view = CachedImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white
        
        addSubview(updatedTimeLabel)
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(photoImageView)
        
        let whiteBackgroundView = UIView(frame: self.frame)
        whiteBackgroundView.backgroundColor = .white
        self.selectedBackgroundView = whiteBackgroundView

    }
    
    func setupConstraints() {
        
        let margin: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            updatedTimeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            updatedTimeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            updatedTimeLabel.heightAnchor.constraint(equalToConstant: 15),
            updatedTimeLabel.topAnchor.constraint(equalTo: topAnchor, constant: margin)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            titleLabel.topAnchor.constraint(equalTo: updatedTimeLabel.bottomAnchor, constant: margin)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            bodyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin),
            bodyLabel.bottomAnchor.constraint(equalTo: photoImageView.topAnchor, constant: -margin)
        ])
        
        photoHeightConstraint = photoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.66)
        photoReducedHeightConstraint = photoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.0)
        
        NSLayoutConstraint.activate([
            photoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            photoImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            photoImageView.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: margin),
            photoHeightConstraint!,
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin)
        ])
        
        photoReducedHeightConstraint?.isActive = false
    }
}
