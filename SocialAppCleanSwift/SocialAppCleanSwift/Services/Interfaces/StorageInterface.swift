//
//  StorageInterface.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 22.12.20.
//
import UIKit

protocol StorageServiceInterface: ServiceInterface {
    //TODO: replace UIImage with NSDATA to remove dependency from UIKit
    func upload(_ image: UIImage, completion: @escaping (String) -> Void)
}
