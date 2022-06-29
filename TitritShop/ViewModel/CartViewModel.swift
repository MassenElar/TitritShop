//
//  CartViewModel.swift
//  TitritShop
//
//  Created by developer on 6/28/22.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var Total: Double = 0
    
    func addToCart(product: Product) {
        print("Pprice: ", product.price ?? "0")
        products.append(product)
        Total += Double(product.price ?? "0") ?? 0
        print(Total)
    }
    
    
    func removeFromCart(product: Product) {
        print("Pprice: ", product.price ?? "0")
        products = products.filter({ $0.id != product.id })
        Total -= Double(product.price ?? "0") ?? 0
        print(Total)
    }
    
    func removeAllProducts() {
        products.removeAll()
    }
}
