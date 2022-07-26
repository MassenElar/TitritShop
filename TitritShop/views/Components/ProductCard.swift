//
//  ProcuctCard.swift
//  TitritShop
//
//  Created by developer on 6/27/22.
//

import SwiftUI

struct ProductCard: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var product: Product
    
    @State var productImage: UIImage = UIImage()
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(uiImage: productImage)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180, height: 250)
                    .scaledToFit()
                    .onAppear() {
                        ImageCache.shared.loadImage(from: product.image_link ?? "") { image in
                            productImage = image
                        }
                    }
                
                VStack(alignment: .leading) {
                    Text(product.name ?? "")
                        .fontWeight(.medium)
                    Text("$\(product.price ?? "")0")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, height: 60 ,alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartViewModel.addToCart(product: CartItems(cartItem: product, quantity: 1, price: product.price ?? ""))
                cartViewModel.totalQuantity()
                print("added to cart")
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .background(Color("buttonColor"))
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .padding(6)
            }
        }
    }
}

struct ProcuctCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductCard(product: Product(id: 0, brand: "Mascara", name: "Ikhan", price: "45", image_link: "www", product_type: "ttt"))
                .environmentObject(CartViewModel())
        }
    }
}
