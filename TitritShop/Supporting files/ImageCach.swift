//
//  ImageCach.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation
import UIKit

class ImageCache {
    
    static let shared = ImageCache()
    
    private init() {}
    
    let cache:  NSCache<NSString, UIImage> = NSCache()
    
    
    func addImage(key: NSString, image: UIImage) {
        self.cache.setObject(image, forKey: key)
    }
    
    func getImage(key: NSString) -> UIImage? {
        return self.cache.object(forKey: key)
    }
    
    func loadImage(from urlString: String, completion: @escaping(UIImage) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let urlLink = urlString as NSString
        
        if let cachedImage = self.getImage(key: urlLink) {
            DispatchQueue.main.async {
                completion(cachedImage)
            }
        } else {
            ImageReq(url: url).startReq { image in
                guard let image = image else {
                    return
                }
                completion(image)
                self.addImage(key: urlLink, image: image)
            }
        }
        
    }
}
