//
//  UITableViewCell+Ext.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 01.12.20.
//

import UIKit

public extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
