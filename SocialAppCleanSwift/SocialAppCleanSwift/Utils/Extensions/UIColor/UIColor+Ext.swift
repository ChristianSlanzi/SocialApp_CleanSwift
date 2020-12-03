//
//  UIColor+Ext.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//

import UIKit

public extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(),
                       green: .random(),
                       blue: .random(),
                       alpha: 1.0)
    }
}
