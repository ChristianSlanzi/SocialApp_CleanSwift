//
//  RadioButtonAlternate.swift
//
//  Created by Christian Slanzi on 30.11.20.
//

//Radio Button
import UIKit

//protocol RadioButtonProtocol {
//    func didToggle()
//}

class RadioButton: UIButton {
    var alternateButton:Array<RadioButton>?
    var didToggle: (Bool) -> Void = { _ in  }

    override func awakeFromNib() {
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = true
    }

    func unselectAlternateButtons(){
        if alternateButton != nil {
            self.isSelected = true

            for aButton:RadioButton in alternateButton! {
                aButton.isSelected = false
            }
        }else{
            toggleButton()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }

    func toggleButton(){
        self.isSelected = !isSelected
        self.didToggle(isSelected)
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.layer.borderColor = UIColor.blue.cgColor
            } else {
                self.layer.borderColor = UIColor.gray.cgColor
            }
            self.setNeedsDisplay()
        }
    }
}
