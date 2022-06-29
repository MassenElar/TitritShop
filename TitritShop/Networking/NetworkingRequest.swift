//
//  NetworkingRequest.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation


protocol NetworkingRequest {
    
    associatedtype ModelType
    
    func decode(data: Data) -> ModelType?
    func startReq(completion: @escaping(ModelType?) -> Void)
}

extension NetworkingRequest {
    func load(url: URL,completion: @escaping(ModelType?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(self.decode(data:data))
        }.resume()
    }
}
