//
//  CachedImageView.swift
//  SocialAppCleanSwift
//
//  Created by Christian Slanzi on 05.12.20.
//

import UIKit

fileprivate let imageCache = NSCache<NSString, UIImage>() // private image caching

class CachedImageView: UIImageView {
    
    func load(url: URL) {
        
        let cacheKey = NSString(string: url.absoluteString) // cache uses URL as key
        
        // check if image exists in cache
        if let cachedImage = imageCache.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        // if image not in cache, fetch from network
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: cacheKey)
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
