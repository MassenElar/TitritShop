//
//  ProductRow.swift
//  TitritShop
//
//  Created by developer on 6/28/22.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var product: Product
    
    @State var productImage: UIImage = UIImage()
    
    var body: some View {
        HStack(spacing: 25) {
            Image(uiImage: productImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 70)
                .cornerRadius(10)
                .onAppear() {
                    ImageCache.shared.loadImage(from: product.image_link ?? "") { image in
                        productImage = image
                    }
                }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name ?? "")
                    .bold()
                Text(String("$\(product.price ?? "0")0"))
                    .font(.caption).bold()
                
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartViewModel.removeFromCart(product: product )
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product(id: 0, brand: "Mascara", name: "Ikhan", price: "45", image_link: "www", product_type: "ttt"))
            .environmentObject(CartViewModel())
    }
}
