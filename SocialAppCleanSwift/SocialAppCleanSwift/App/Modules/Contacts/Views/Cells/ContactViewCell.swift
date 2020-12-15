//
//  ContactViewCell.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 13.12.20.
//

import UIKit

class ContactViewCell: UITableViewCell {
    
    var item: ContactsModel.ViewModel.DisplayedContact? {
        didSet {
            if let item = item {
                titleLabel.text = item.name
                if let photoUrl = item.avatarURL{
                    photoImageView.load(url: photoUrl)
                }
            }
        }
    }

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
        
        addSubview(titleLabel)
        addSubview(photoImageView)
        
        let whiteBackgroundView = UIView(frame: self.frame)
        whiteBackgroundView.backgroundColor = .white
        self.selectedBackgroundView = whiteBackgroundView

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
            titleLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: margin),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        
    }
}
