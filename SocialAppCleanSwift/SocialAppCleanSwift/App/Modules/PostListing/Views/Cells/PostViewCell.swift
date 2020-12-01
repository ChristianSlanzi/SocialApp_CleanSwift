//
//  PostViewCell.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//

import UIKit

class PostViewCell: UITableViewCell {
    
    var item: PostListingModel.ViewModel.DisplayedPost? {
        didSet {
            if let item = item {
                titleLabel.text = item.title
                bodyLabel.text = item.body
            }
        }
    }

    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 25)
        lbl.textAlignment = .left
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private let bodyLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .right
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
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
        addSubview(bodyLabel)
        
        let whiteBackgroundView = UIView(frame: self.frame)
        whiteBackgroundView.backgroundColor = .white
        self.selectedBackgroundView = whiteBackgroundView

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: bodyLabel.leftAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            bodyLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            bodyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            bodyLabel.heightAnchor.constraint(equalToConstant: 30),
            bodyLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
    }
}
