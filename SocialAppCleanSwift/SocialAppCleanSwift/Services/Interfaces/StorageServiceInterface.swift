//
//  StorageServiceInterface.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 22.12.20.
//
import Foundation

protocol StorageServiceInterface: ServiceInterface {
    func upload(_ imageData: Data, completion: @escaping (String) -> Void)
}
