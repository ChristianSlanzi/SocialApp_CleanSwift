//
//  CGFloat+Ext.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 03.12.20.
//

import UIKit

public extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
