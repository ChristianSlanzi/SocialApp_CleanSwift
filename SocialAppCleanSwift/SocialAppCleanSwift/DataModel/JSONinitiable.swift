//
//  JSONinitiable.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 30.11.20.
//

import SwiftyJSON

public protocol JSONinitiable {
    init(json: JSON)
}
