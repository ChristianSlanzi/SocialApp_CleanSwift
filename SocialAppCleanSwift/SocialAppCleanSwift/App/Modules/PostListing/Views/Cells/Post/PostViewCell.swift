//
//  PostViewCell.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//

import UIKit

protocol IPostViewCell: class {
    func displayFetchedUser(viewModel: PostViewCellModel.ViewModel)
}

class PostViewCell: UITableViewCell, IPostViewCell {
    func displayFetchedUser(viewModel: PostViewCellModel.ViewModel) {
        displayedUser = viewModel.displayedUser
    }
    
    var interactor: IPostViewCellInteractor!
    
    private var photoHeightConstraint: NSLayoutConstraint?
    private var photoReducedHeightConstraint: NSLayoutConstraint?
    //private var photoHeightConstraint: NSLayoutConstraint?
    
    var displayedUser: PostViewCellModel.ViewModel.DisplayedUser? {
        didSet {
            if let displayedUser = displayedUser, displayedUser.id == item?.userId {
                nameLabel.text = displayedUser.name
                if let avatarUrl = displayedUser.userAvatarUrl {
                    avatarImageView.load(url: avatarUrl)
                }
            }
        }
    }
    
    var item: PostListingModel.ViewModel.DisplayedPost? {
        didSet {
            if let item = item {
                updatedTimeLabel.text = item.updatedTime
                titleLabel.text = item.title
                bodyLabel.text = item.body
                if let photoUrl = item.photoUrl {
                    photoImageView.isHidden = false
                    photoImageView.load(url: photoUrl)
                    photoHeightConstraint?.isActive = true
                    photoReducedHeightConstraint?.isActive = false
                } else {
                    photoImageView.isHidden = true
                    photoHeightConstraint?.isActive = false
                    photoReducedHeightConstraint?.isActive = true
                }
                
                likesLabel.text = "\(item.likes) likes"
                commentsLabel.text = "\(item.comments) comments"
            
                let parameters = ["userId" : item.userId]
                let request = PostViewCellModel.Request(parameters: parameters as [String : Any])
                interactor.fetchUser(request: request)
                
                self.setNeedsLayout()
            }
        }
    }
    
    private let avatarImageView: CachedImageView = {
        let view = CachedImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.text = "User"
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
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
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    private let likeImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "like")
        //view.backgroundColor = .gray
        return view
    }()
    
    private let commentImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "comment")
        //view.backgroundColor = .gray
        return view
    }()
    
    private let likesLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "0 likes"
        return view
    }()
    
    private let commentsLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "0 comments"
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        setupActions()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white
        
        addSubviews(nameLabel,
                    avatarImageView,
                    updatedTimeLabel,
                    titleLabel,
                    bodyLabel,
                    photoImageView,
                    likeImageView,
                    commentImageView,
                    likesLabel,
                    commentsLabel)
        
        let whiteBackgroundView = UIView(frame: self.frame)
        whiteBackgroundView.backgroundColor = .white
        self.selectedBackgroundView = whiteBackgroundView

    }
    
    func setupConstraints() {
        
        let margin: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: margin),
            avatarImageView.heightAnchor.constraint(equalToConstant: 70),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: margin),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            updatedTimeLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0),
            updatedTimeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            updatedTimeLabel.heightAnchor.constraint(equalToConstant: 15),
            updatedTimeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: margin)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            titleLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: margin)
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
            photoHeightConstraint!//,
            //photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin)
        ])
        
        NSLayoutConstraint.activate([
            likeImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
            likeImageView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: margin),
            likeImageView.widthAnchor.constraint(equalToConstant: 15),
            likeImageView.heightAnchor.constraint(equalToConstant: 15),
            likeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin)
        ])
        
        NSLayoutConstraint.activate([
            commentImageView.leftAnchor.constraint(equalTo: likeImageView.rightAnchor, constant: margin),
            commentImageView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: margin),
            commentImageView.widthAnchor.constraint(equalToConstant: 15),
            commentImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            commentsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
            commentsLabel.bottomAnchor.constraint(equalTo: likeImageView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            likesLabel.rightAnchor.constraint(equalTo: commentsLabel.leftAnchor, constant: -margin),
            likesLabel.bottomAnchor.constraint(equalTo: likeImageView.bottomAnchor, constant: 0)
        ])
        
        photoReducedHeightConstraint?.isActive = false
    }
    
    private func setupActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        tap.numberOfTapsRequired = 1
        likeImageView.addGestureRecognizer(tap)
        likeImageView.isUserInteractionEnabled = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews() // call super.layoutSubviews()
        avatarImageView.maskCircle()
    }
    
    @objc func likeTapped(sender: UITapGestureRecognizer) {
    }
}


