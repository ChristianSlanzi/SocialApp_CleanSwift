//
//  UITextView+Placeholder.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 16.12.20.
//

import UIKit

/// Extend UITextView and implemented UITextViewDelegate to listen for changes
extension UITextView: UITextViewDelegate {
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    public var placeholderColor: UIColor {
            get {
                var placeholderColor = UIColor.lightGray
                
                if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                    placeholderColor = placeholderLabel.textColor
                }
                
                return placeholderColor
            }
            set {
                if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                    placeholderLabel.textColor = newValue
                } else {
                    self.addPlaceholder(color: newValue)
                }
            }
        }
        
    public var placeholderFont: UIFont {
            get {
                var placeholderFont = font
                
                if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                    placeholderFont = placeholderLabel.font
                }
                
                return placeholderFont!
            }
            set {
                if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                    placeholderLabel.font = newValue
                    placeholderLabel.sizeToFit()
                } else {
                    self.addPlaceholder(font: newValue)
                }
            }
        }
        
      public var placeholderTopInset: CGFloat {
            get {
                var inset: CGFloat = textContainerInset.top - 2
                
                if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                    inset = placeholderLabel.frame.origin.y
                }
                
                return inset
            }
            set {
                if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                    placeholderLabel.frame.origin.y = newValue
                } else {
                    self.addPlaceholder(topInset: newValue)
                }
            }
        }
        
    public var placeholderLeftInset: CGFloat {
            get {
                var inset: CGFloat = textContainer.lineFragmentPadding
                
                if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                    inset = placeholderLabel.frame.origin.x
                }
                
                return inset
            }
            set {
                if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                    placeholderLabel.frame.origin.x = newValue
                } else {
                    self.addPlaceholder(leftInset: newValue)
                }
            }
        }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = !self.text.isEmpty
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height

            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String? = "", font: UIFont? = nil, color: UIColor? = nil, topInset: CGFloat? = nil, leftInset: CGFloat? = nil) {
            let placeholderLabel = UILabel()
            
            placeholderLabel.text = placeholderText
            placeholderLabel.font = font ?? self.font
            placeholderLabel.textColor = color ?? UIColor.lightGray
            placeholderLabel.sizeToFit()
            placeholderLabel.frame.origin.y = topInset ?? textContainerInset.top - 2
            placeholderLabel.frame.origin.x = leftInset ?? textContainer.lineFragmentPadding

            placeholderLabel.tag = 100
            
            placeholderLabel.isHidden = !self.text.isEmpty
            
            self.addSubview(placeholderLabel)
            self.resizePlaceholder()
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(textViewDidChange),
                                                   name: UITextView.textDidChangeNotification,
                                                   object: nil)
        }
}
