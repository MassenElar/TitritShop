//
//  MakeUpData.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import Foundation


//struct ApiData: Decodable {
//    let data: [Product]
//}

struct Product: Decodable, Identifiable {
    let id: Int?
    let brand: String?
    let name: String?
    let price: String?
    let image_link: String?
    let product_type: String?
}
