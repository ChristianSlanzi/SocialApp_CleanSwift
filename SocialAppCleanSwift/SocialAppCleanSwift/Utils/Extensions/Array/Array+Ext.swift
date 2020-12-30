//
//  Array+Ext.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.12.20.
//

import Foundation

public extension Array {
    subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
