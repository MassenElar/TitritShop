//
//  ProductRow.swift
//  TitritShop
//
//  Created by developer on 6/28/22.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var product: CartItems
    
    @State var productImage: UIImage = UIImage()
    
    @State var itemQuantity = 1
    var body: some View {
        
        HStack(spacing: 25) {
            Image(uiImage: productImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 70)
                .cornerRadius(10)
                .onAppear() {
                    ImageCache.shared.loadImage(from: product.cartItem.image_link ?? "") { image in
                        productImage = image
                    }
                }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.cartItem.name ?? "")
                    .bold()
                Text(String("$\(product.cartItem.price ?? "0")0"))
                    .font(.caption).bold()
                HStack {
                    Text("Quantity:")
                    Picker("Number of Items", selection: $itemQuantity, content: {
                        ForEach((1..<10), id: \.self) {
                            Text("\($0)")
                        }
                    })
                    .pickerStyle(.menu)
                    .onChange(of: itemQuantity, perform: { newValue in
                        DispatchQueue.main.async {
                            product.Quantity = newValue
                            cartViewModel.totalQuantity()
//                            cartViewModel.Total = cartViewModel.totalPrice()
                        }
                        
                    })
                    .onAppear() {
                        self.itemQuantity = product.Quantity
                    }
                }
                
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartViewModel.removeFromCart(product: product)
                    cartViewModel.totalQuantity()
//                    cartViewModel.Total = cartViewModel.totalPrice()
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: CartItems(cartItem: Product(id: 0, brand: "Mascara", name: "Ikhan", price: "45", image_link: "www", product_type: "ttt"), quantity: 1, price: "9.00"))
            .environmentObject(CartViewModel())
    }
}
