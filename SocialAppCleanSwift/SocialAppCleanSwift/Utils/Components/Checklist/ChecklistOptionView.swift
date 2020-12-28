//
//  ChecklistOptionView.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 28.12.20.
//

import UIKit

struct SurveyOption {
    var text: String
}

class ChecklistOptionView: CustomView {

    struct Status {
        var selected: Bool
    }
    
    var status = Status(selected: false)
    var optionWasSelected: (ChecklistOptionView) -> Void = { _ in }
    var optionWasDeselected: (ChecklistOptionView) -> Void = { _ in }
    
    public override var isUserInteractionEnabled: Bool {
        didSet {
            titleLabel.textColor = isUserInteractionEnabled ? UIColor(hexString: "#6e6e6e") : .lightGray
        }
    }
    
    /*
    var item: W4UChecklistQuestionAnswer? {
        didSet {
            if let item = item {
                //icon.image = UIImage(named: item.iconName)
                titleLabel.text = item.text
            }
        }
    }
 */
    
    private let roundLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    private let icon: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "news")?.withRenderingMode(.alwaysTemplate))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
    
        return imgView
    }()
    
    private var iconTintColor: UIColor = UIColor(hexString: "#007c8c")
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "text"
        lbl.textColor = UIColor(hexString: "#6e6e6e")
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        //lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .clear
        icon.image = UIImage(named: "selected")
        icon.tintColor = UIColor(hexString: "#007c8c")//.brand(for: .light)
        
        roundLabel.layer.cornerRadius = 13.5
        if #available(iOS 11.0, *) {
            roundLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        roundLabel.layer.masksToBounds = true
        roundLabel.layer.borderColor = UIColor.lightGray.cgColor
        roundLabel.layer.borderWidth = 2
        
        addSubview(roundLabel)
        addSubview(icon)
        addSubview(titleLabel)
        
        self.addTapGestureRecognizer {
            //self.setSelected(true, animated: true)
            self.toggleSelection()
        }
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            roundLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            //roundLabel.rightAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: -10),
            roundLabel.widthAnchor.constraint(equalToConstant: 27),
            roundLabel.heightAnchor.constraint(equalToConstant: 27),
            roundLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: roundLabel.centerXAnchor, constant: 0),
            //icon.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            icon.widthAnchor.constraint(equalToConstant: 13.5),
            icon.heightAnchor.constraint(equalToConstant: 13.5),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            
            titleLabel.leftAnchor.constraint(equalTo: roundLabel.rightAnchor, constant: 20),
            //titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            //titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            //titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            //titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
        
    }
    
    public func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    public func setSelectionIcon(name: String, tintColor: UIColor) {
        icon.image = UIImage(named: name)
        icon.tintColor = tintColor
        iconTintColor = tintColor
    }
    
    public func toggleSelection() {
        setOptionSelected(!status.selected, animated: true)
    }
    
    public func setOptionSelected(_ selected: Bool, animated: Bool) {
        
        if selected {
            icon.isHidden = false
            roundLabel.layer.borderColor = iconTintColor.cgColor
            //delegate
            //optionWasSelected(self)
        } else {
            icon.isHidden = true
            roundLabel.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        if status.selected != selected {
            status.selected = selected
            if(selected) {
               optionWasSelected(self)
            }
        }
    }
}
