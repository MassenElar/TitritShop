//
//  CartView.swift
//  TitritShop
//
//  Created by developer on 6/28/22.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var carViewModel: CartViewModel
    
    @State private var showingAlert = false
    
    @State private var disButt = false
    
    var body: some View {
        ScrollView {
            if carViewModel.products.count == 0 {
                Text("Cart is Empty")
            } else {

                ForEach(carViewModel.products, id: \.id) { product in 
                    ProductRow(product: product)
                }
                HStack {
                    Text("Your Total is:")
                        .bold()
                        .foregroundColor(.red)
                    Spacer()
                    Text(String(format: "%.2f", carViewModel.Total))
                        .bold()
                        .foregroundColor(.red)
                }
                .padding()
            }
            
            PayementButton(action: {
                showingAlert = true
                carViewModel.removeAllProducts()
                    
            })
            .hiddenConditionally(isHidden: carViewModel.products.count == 0)
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
