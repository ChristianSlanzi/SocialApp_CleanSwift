//
//  TodoViewCell.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 04.12.20.
//

import UIKit

protocol TodoViewCellDelegate {
    func updateTodo(todo: TodoListingModel.ViewModel.DisplayedTodo)
}

class TodoViewCell: UITableViewCell {
    
    var delegate: TodoViewCellDelegate?
    
    var item: TodoListingModel.ViewModel.DisplayedTodo? {
        didSet {
            if let item = item {
                titleLabel.text = item.name
                
                titleLabel.textColor = item.completed ? .gray : .black
                
                checkbox.isSelected = item.completed
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
    
    private let checkbox: RadioButton = {
        let button = RadioButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
        checkbox.didToggle = { newStatus in
            if self.item != nil {
                self.item!.completed = newStatus
                self.delegate?.updateTodo(todo: self.item!)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(checkbox)
        
        let whiteBackgroundView = UIView(frame: self.frame)
        whiteBackgroundView.backgroundColor = .white
        self.selectedBackgroundView = whiteBackgroundView

    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            checkbox.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            checkbox.heightAnchor.constraint(equalToConstant: 30),
            checkbox.widthAnchor.constraint(equalToConstant: 30),
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
    }
}
