//
//  ProductRequest.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation

struct makupProduct {
    
    
    func getProduct(completion: @escaping(Result<[Product], NetworkingError>) -> Void) {
        let request = ModelRequest(resource: ProductResource())
        
        request.startReq { model in
            guard let model = model else {
                completion(.failure(.dataNotFound))
                return
            }
            let products = model
            completion(.success(products))

        }
    }

}
