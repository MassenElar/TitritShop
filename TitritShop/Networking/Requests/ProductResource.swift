//
//  ProductResource.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation


struct ProductResource: AnySource {
    
    typealias ModelType = [Product]
    
    var url: URL
    
    init() {
        let resourceLink = "https://makeup-api.herokuapp.com/api/v1/products.json"
        
        guard let resourceURL = URL(string: resourceLink) else {
            fatalError()
        }
        
        self.url = resourceURL
    }
}
