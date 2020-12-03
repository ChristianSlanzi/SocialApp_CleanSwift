//
//  UICollectionViewCell+Ext.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//

import UIKit

public extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
