//
//  ModelRequest.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation

class ModelRequest<Resource: AnySource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
    
}



extension ModelRequest: NetworkingRequest {
    
    func decode(data: Data) -> Resource.ModelType? {
        return try? JSONDecoder().decode(Resource.ModelType.self, from: data)
    }
    
    func startReq(completion: @escaping (Resource.ModelType?) -> Void) {
        load(url: resource.url, completion: completion)
    }
}
