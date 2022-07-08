//
//  CartView.swift
//  TitritShop
//
//  Created by developer on 6/28/22.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel

    @State private var showingAlert = false
    
    @State private var disButt = false
    
    @State private var ikhan = CartViewModel().Total

    var body: some View {
        ScrollView {
            if cartViewModel.products.count == 0 {
                Text("Cart is Empty")
            } else {

                ForEach(cartViewModel.products, id: \.id) { product in
                    ProductRow(product: product)
                }
                
                HStack {
                    Text("Your Total is:")
                        .bold()
                        .foregroundColor(.red)
                    Spacer()
                    Text(String(format: "%.2f", cartViewModel.products.reduce(0, {$0 + ((Double($1.price) ?? 0) * Double($1.Quantity))})))
                        .bold()
                        .foregroundColor(.red)
                }
                .padding()
            }
            
            PayementButton(action: {
                showingAlert = true
                cartViewModel.removeAllProducts()
                cartViewModel.Total = 0
                cartViewModel.totalQuantity()
                    
            })
            .hiddenConditionally(isHidden: cartViewModel.products.count == 0)
            .alert(isPresented: self.$showingAlert, content: {
                Alert(title: Text("Payment Recieved Successfully"), dismissButton: .cancel())
            })
            
        }
        .navigationTitle("My Cart")
        .padding(.top)
    }
    
}

extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartViewModel())
    }
}
