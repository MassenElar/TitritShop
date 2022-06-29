//
//  ApiManager.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation
protocol AnySource {
    associatedtype ModelType: Decodable
    var url: URL { get }
}
