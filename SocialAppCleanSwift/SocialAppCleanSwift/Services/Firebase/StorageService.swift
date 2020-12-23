//
//  StorageService.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 21.12.20.
//

import UIKit
import FirebaseStorage

class StorageService: StorageServiceInterface {
    private init() {}
    static let shared = StorageService()
    
    
    private let storage = Storage.storage()
    private lazy var imagesReference = storage.reference().child("images")
    
    func upload(_ imageData: Data, completion: @escaping (String) -> Void) {
        let imageRef = imagesReference.child("images/\(Date().timeIntervalSince1970).jpg")
        
        //guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        imageRef.putData(imageData, metadata: nil) { (_, error) in
            if let unwrappedError = error {
                print(unwrappedError)
            } else {
                imageRef.downloadURL(completion: { (url, downloadError) in
                     if let unwrappedDownloadError = downloadError {
                         print(unwrappedDownloadError)
                     } else if let unwrappedUrl = url {
                         completion(unwrappedUrl.absoluteString)
                     }
                })
            }
        }
    }
    
}
