//
//  ImageRequest.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation
import UIKit


class ImageReq {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

extension ImageReq: NetworkingRequest {
   
    func decode(data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func startReq(completion: @escaping (UIImage?) -> Void) {
        load(url: url, completion: completion)
    }
    
}
