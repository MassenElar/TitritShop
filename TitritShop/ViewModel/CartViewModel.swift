//
//  CartViewModel.swift
//  TitritShop
//
//  Created by developer on 6/28/22.
//

import Foundation


class CartItems: Identifiable, ObservableObject {
    let id = UUID()
    @Published var cartItem: Product
    @Published var Quantity: Int
    @Published var price: String
    
    init(cartItem: Product, quantity: Int, price: String) {
        self.Quantity = quantity
        self.cartItem = cartItem
        self.price = price
    }
}

class CartViewModel: ObservableObject {
    
    @Published var products: [CartItems] = []
    @Published var Total: Double = 0
    @Published var quantity: Int = 0
    
    
    
    func addToCart(product: CartItems) {
        print("Pprice: ", product.price )
        for prod in products {
            if prod.cartItem.id == product.cartItem.id {
                prod.Quantity = prod.Quantity + 1
                Total += Double(product.price ) ?? 0
                print(Total)
                return
            }
        }
        products.append(product)
        Total += Double(product.price ) ?? 0
        print(Total)
    }
    
    func totalQuantity() {
        quantity = products.reduce(0, {$0 + $1.Quantity})
        print(quantity)
    }
    
    
    func removeFromCart(product: CartItems) {
        print("Pprice: ", product.cartItem.price ?? "0")
        products = products.filter({ $0.cartItem.id != product.cartItem.id })
        Total -= Double(product.cartItem.price ?? "0") ?? 0
        print(Total)
    }
    
    func removeAllProducts() {
        products.removeAll()
    }
}

// fix the cartbutton numbers of items 
