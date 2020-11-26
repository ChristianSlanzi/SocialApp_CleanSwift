//
//  Module.swift
//  ARTDEVCommon
//
//  Created by Christian Slanzi on 26.11.20.
//

import Foundation
import UIKit

public protocol IModule {
    func presentView(parameters: [String: Any])
    func createView(parameters: [String: Any]) -> UIViewController?
}

public protocol Module {
    var routePath: String { get }
}
