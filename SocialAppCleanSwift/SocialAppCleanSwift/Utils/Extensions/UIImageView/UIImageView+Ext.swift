//
//  UIImageView+Ext.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 15.12.20.
//

import UIKit

extension UIImageView {
    public func maskCircle() {
      self.contentMode = UIView.ContentMode.scaleAspectFill
      self.layer.cornerRadius = self.frame.height / 2
      self.layer.masksToBounds = false
      self.clipsToBounds = true
    }
}
